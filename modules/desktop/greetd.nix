{
  pkgs,
  lib,
  inputs,
  ...
}: let
  startHyprland = pkgs.writeShellScriptBin "start-hyprland" ''
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=Hyprland
    exec ${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/bin/start-hyprland
  '';
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/bin/hyprland --config /etc/greetd/hyprland-greeter-config.lua";
        user = "greeter";
      };
    };
  };

  programs.regreet = {
    enable = true;

    font = {
      name = "DejaVu Sans";
      size = 14;
    };
  };

  environment.systemPackages = with pkgs; [
    startHyprland
    orchis-theme
    gnome-themes-extra
    regreet
  ];

  environment.etc = {
    "greetd/regreet.toml".text = lib.mkForce ''
      [background]
      fit = "Cover"
      path = "/etc/greetd/wall.png"
    '';

    "greetd/hyprland-greeter-config.lua".text = ''
      hl.env("GTK_USE_PORTAL", "0")
      hl.env("GDK_DEBUG", "no-portals")
      hl.config({
      debug = {
        enable_stdout_logs = false
      },
      animations = {
          enabled = false
      },
      decoration = {
          rounding = 10,
          blur = {
              enabled = true
          }
      },
      general = {
          gaps_in = 0,
          gaps_out = 0,
          border_size = 0
      },
      misc = {
          disable_hyprland_logo = true,
          disable_splash_rendering = true,
          -- Suppress watchdog warning - greetd doesn't pass fd properly to start-hyprland
          disable_watchdog_warning = true
      },
      input = {
          kb_layout = "us",
          repeat_delay = 400,
          repeat_rate = 40
      }
      })
      hl.on("hyprland.start", function()
        hl.exec_cmd("regreet")
      end)
    '';

    "greetd/etc".text = ''
      XDG_SESSION_TYPE=wayland
      XDG_CURRENT_DESKTOP=wayland
    '';

    "greetd/wall.png".source = ./assets/wallpapers/bliss.jpg;
  };
}
