{pkgs, ...}: let
  cliphist = "${pkgs.cliphist}/bin/cliphist";
  wlPaste = "${pkgs.wl-clipboard}/bin/wl-paste";
  cliphistPicker = pkgs.writeShellScriptBin "cliphist-picker" ''
    tmp_dir="/tmp/cliphist"
        mkdir -p "$tmp_dir"
        rm -f "$tmp_dir"/*.png  # optional cleanup
        cliphist list | while read -r line; do
          if [ -z "$line" ]; then continue; fi
          id=$(echo "$line" | cut -f1)
          preview=$(echo "$line" | cut -f2-)
          if echo "$preview" | grep -q '^binary image/'; then
            img_path="$tmp_dir/$id.png"
            cliphist decode "$id" > "$img_path"
            echo -e "Image\0info\x1f$id\0icon\x1f$img_path"
          else
            echo -e "$preview\0info\x1f$id"
          fi
        done
  '';
in {
  systemd.user.services.cliphist-text = {
    description = "cliphist watcher (text)";
    partOf = ["graphical-session.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      ExecStart = "${wlPaste} --type text --watch ${cliphist} store";
      Restart = "on-failure";
      RestartSec = 1;
    };
    wantedBy = ["graphical-session.target"];
  };

  systemd.user.services.cliphist-image = {
    description = "cliphist watcher (image)";
    partOf = ["graphical-session.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      ExecStart = "${wlPaste} --type image --watch ${cliphist} store";
      Restart = "on-failure";
      RestartSec = 1;
    };
    wantedBy = ["graphical-session.target"];
  };
  environment.systemPackages = [
    cliphistPicker
    pkgs.wl-clipboard
    pkgs.cliphist
  ];
}
# {
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
# systemd.user.services.cliphist = {
#   description = "Clipboard history for Wayland";
#   wantedBy = [ "default.target" ];
#   unitConfig = {
#       StartLimitBurst = 3;
#       StartLimitIntervalSec = 5;
#   };
#   serviceConfig = {
#     ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
#     Restart = "on-failure";
#     RestartSec = 1;
#     SyslogIdentifier = "cliphist";
#     Environment = [ "G_MESSAGES_PREFIXED=all" ];
#   };
# };

