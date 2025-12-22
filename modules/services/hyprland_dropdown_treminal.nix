{ pkgs, ... }:

{
  systemd.user.services.dropdown_terminal = {
    description = "Hyprland dropdown terminal (foot)";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    unitConfig = {
      ConditionPathExistsGlob = "%t/hypr/*/.socket2.sock";
    };

    serviceConfig = {
      Restart = "always";
      RestartSec = 1;
      ExecStart = "${pkgs.foot}/bin/foot --title dropdown_terminal --font=monospace:size=14";
      KillMode = "mixed";
      TimeoutStopSec = 2;
    };
  };
}
