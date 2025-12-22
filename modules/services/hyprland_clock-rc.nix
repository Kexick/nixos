{ pkgs, ... }:

{
  systemd.user.services.clock-rs = {
    description = "Hyprland clock-rs";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    unitConfig = {
      ConditionPathExistsGlob = "%t/hypr/*/.socket2.sock";
    };

    serviceConfig = {
      Restart = "always";
      RestartSec = 1;
      ExecStart = "${pkgs.foot}/bin/foot --title clock --font=monospace:size=16 ${pkgs.clock-rs}/bin/clock-rs";
      TimeoutStopSec = 2;
      KillMode = "mixed";
    };
  };
}
