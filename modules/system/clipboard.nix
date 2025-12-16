{ pkgs, ... }:

{
#   systemd.user.services.walker = {
#     description = "Walker background service (Wayland only)";
#     wantedBy = [ "default.target" ];
#     path = [ 
#         pkgs.bash
#         pkgs.cliphist
#         pkgs.coreutils
#         pkgs.foot
#         pkgs.swww 
#         pkgs.wl-clipboard
#     ];
#     unitConfig = {
#         StartLimitBurst = 3;
#         StartLimitIntervalSec = 5;
#     };
#     serviceConfig = {
#         ExecStartPre = "${pkgs.bash}/bin/bash -lc \"while ! ls \\\"$XDG_RUNTIME_DIR\\\"/wayland-* >/dev/null 2>&1; do sleep 1; done\"";
#       ExecStart = "${pkgs.walker}/bin/walker --gapplication-service";
#       Restart = "on-failure";
#       RestartSec = 1;
#     };
#   };
#
  systemd.user.services.cliphist = {
    description = "Clipboard history for Wayland";
    wantedBy = [ "default.target" ];
    unitConfig = {
        StartLimitBurst = 3;
        StartLimitIntervalSec = 5;
    };
    serviceConfig = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "on-failure";
      RestartSec = 1;
      SyslogIdentifier = "cliphist";
      Environment = [ "G_MESSAGES_PREFIXED=all" ];
    };
  };
     environment.systemPackages = [
        pkgs.wl-clipboard
        pkgs.cliphist
      ];
}
