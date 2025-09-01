{ pkgs, ... }:
{
  systemd.user.services.cliphist = {
    description   = "Clipboard history for Wayland";
    after         = [ "graphical-session.target" ];
    wantedBy      = [ "graphical-session.target" ];
    serviceConfig = {
      Environment = "WAYLAND_DISPLAY=wayland-1";
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart   = "always";
    };
  };

  systemd.user.services.walker = {
      description = "Walker background service";
      after = [ "graphical-session.target" ];
      wantedBy = [ "graphical-session.target" ];
      serviceConfig = {
        Environment = ["WAYLAND_DISPLAY=wayland-1" "TERMINAL=foot"];
        ExecStart = "walker --gapplication-service";
        Restart = "always";
        RestartSec = 1;
      };
    };

  environment.systemPackages = [
    pkgs.wl-clipboard
    pkgs.cliphist
  ];
}
