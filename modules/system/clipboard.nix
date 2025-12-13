{ pkgs, ... }:
{
    systemd.user.services.walker = {
        description = "Walker background service";
        after = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        serviceConfig = {
            ExecStart = "${pkgs.walker}/bin/walker --gapplication-service";
            Restart = "always";
            RestartSec = 1;
        };
    };

    systemd.user.services.cliphist = {
    description   = "Clipboard history for Wayland";
    after         = [ "graphical-session.target" ];
    wantedBy      = [ "graphical-session.target" ];
    serviceConfig = {
          ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
          Restart   = "always";
        };
    };


  environment.systemPackages = [
    pkgs.wl-clipboard
    pkgs.cliphist
  ];
}
