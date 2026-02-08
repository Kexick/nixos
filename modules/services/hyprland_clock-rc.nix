{ pkgs, ... }:

{
  systemd.user.services.clock-rs = {
    description = "Hyprland clock-rs";
    wantedBy = [ "default.target" ];
    after = [ "default.target" ];

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
