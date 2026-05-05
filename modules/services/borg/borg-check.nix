{
  config,
  pkgs,
  lib,
  ...
}: let
  jobs = config.services.borgbackup.jobs;

  checkScript =
    ''
      FAILED=0

      notify_safe() {
        BUS="/run/user/$(id -u)/bus"
        if [ -S "$BUS" ]; then
          export XDG_RUNTIME_DIR="/run/user/$(id -u)"
          export DBUS_SESSION_BUS_ADDRESS="unix:path=$BUS"
          ${pkgs.libnotify}/bin/notify-send -a "Borg-check" "$1" "$2" || true
        fi
      }

    ''
    + lib.concatStringsSep "\n" (lib.mapAttrsToList (name: job: let
        needsPass = job.encryption.mode != "none" && job.encryption.passCommand != null;
        passExport =
          lib.optionalString needsPass
          ''export BORG_PASSCOMMAND="${job.encryption.passCommand}"'';
      in ''
        echo "Checking ${name} (${job.repo})..."
        ${passExport}
        if ! ${pkgs.borgbackup}/bin/borg check "${job.repo}"; then
          echo "  FAILED"
          FAILED=$((FAILED + 1))
        else
          echo "  OK"
        fi
        unset BORG_PASSCOMMAND
      '')
      jobs)
    + ''

      if [ $FAILED -gt 0 ]; then
        notify_safe "Borg-check" "$FAILED с ошибками"
        exit 1
      else
        notify_safe "Borg-check" "Состояние репозиториев ОК"
      fi
    '';
in {
  systemd.services.borg-check = {
    description = "Borg repository integrity check";
    serviceConfig = {
      Type = "oneshot";
      User = config.borgJobs.userName;
      Group = config.borgJobs.userGroup;
    };
    path = [pkgs.openssh];
    environment.HOME = "/home/${config.borgJobs.userName}";
    script = checkScript;
  };

  systemd.timers.borg-check = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "monthly";
      Persistent = true;
    };
  };
}
