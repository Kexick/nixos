{pkgs, ...}: let
  startHyprland = pkgs.writeShellScriptBin "start-hyprland" ''
    export XDG_SESSION_TYPE=wayland
     export XDG_CURRENT_DESKTOP=Hyprland
     exec ${pkgs.hyprland}/bin/Hyprland
  '';
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.regreet}/bin/regreet";
        user = "kexick";
      };
    };
  };
  programs.regreet = {
    enable = true;
    theme.name = "Adwaita";
    font = {
      name = "DejaVu Sans";
      size = "14";
    };
    cursorTheme = "Adwaita";
  };
  environment.etc."greetd/regreet.toml".text = ''
    background-image = "/etc/regreet/background.png"
  '';
  environment.etc."greetd/etc".text = ''
    XDG_SESSION_TYPE=wayland
    XDG_CURRENT_DESKTOP=wayland
  '';
  environment.systemPackages = with pkgs; [
    startHyprland
  ];
}
