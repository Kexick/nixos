{ config, lib, pkgs, ... }:

let
  mainUser =
    let
      users = lib.filterAttrs (_: v: v ? uid && v.uid == 1000) config.users.users;
      names = builtins.attrNames users;
    in if names == [] then "kexick" else builtins.head names;

  mkBorgJob =
    {
      name,
      repo,
      schedule ? config.borgJobs.defaultSchedule,
      pruneWeekly ? config.borgJobs.defaultPruneWeekly,
      pruneMonthly ? config.borgJobs.defaultPruneMonthly,
      compression ? config.borgJobs.defaultCompression,
      notify ? config.borgJobs.defaultNotify,
      calcSize ? config.borgJobs.defaultCalcSize,
      delay ? config.borgJobs.defaultDelay,

      patterns ? [
        "${config.borgJobs.configBase}/default.txt"
        "${config.borgJobs.configBase}/${name}.txt"
      ]
    }:

    let
      patternsArgs = builtins.concatLists (map (p: [ "--patterns-from" p ]) patterns);

        # lib.concatStringsSep "\n" (map (p: "--patterns-from ${p}") patterns);

postHookScript =
  if notify then ''
    BUS="/run/user/$(id -u)/bus"

    notify_safe() {
      if [ -n "${DISPLAY:-}" ] && [ -S "$BUS" ]; then
        export XDG_RUNTIME_DIR="/run/user/$(id -u)"
        export DBUS_SESSION_BUS_ADDRESS="unix:path=$BUS"
        ${pkgs.libnotify}/bin/notify-send "$1" "$2" || true
      fi
    }

    if [ "$exitStatus" -ne 0 ]; then
      notify_safe "Borg (${name})" "Ошибка (код $exitStatus)"
    else
      ${lib.optionalString calcSize ''
        LATEST=$(${pkgs.borgbackup}/bin/borg list ${repo} --last 1 --format "{archive}{NL}")
        SIZE_BYTES=$(${pkgs.borgbackup}/bin/borg info ${repo}::$LATEST --json | ${pkgs.jq}/bin/jq -r '.archives[0].stats.compressed_size')

        SIZE_HUMAN=$(${pkgs.gawk}/bin/awk -v s="$SIZE_BYTES" 'BEGIN {
          if (s >= 1024*1024*1024)      printf "%.2f GiB", s/1024/1024/1024;
          else if (s >= 1024*1024)     printf "%.2f MiB", s/1024/1024;
          else                         printf "%d B", s;
        }')

        notify_safe "Borg (${name})" "Готово. Размер: $SIZE_HUMAN"
      ''}
    fi
  '' else "";
    in
    {
      paths = [ ];
      extraCreateArgs = patternsArgs;

      repo = repo;
      encryption.mode = "none";
      compression = compression;

      prune.keep = {
        weekly = pruneWeekly;
        monthly = pruneMonthly;
      };

      startAt = schedule;

      preHook = ''
        if [ ! -d "${repo}" ]; then
          mkdir -p "${repo}"
          chown ${config.borgJobs.userName}:${config.borgJobs.userGroup} "${repo}"
        fi
        sleep ${delay}
      '';

      postHook = postHookScript;

      user = config.borgJobs.userName;
      group = config.borgJobs.userGroup;
    };

in
{
  options.borgJobs = {
    userName = lib.mkOption {
      type = lib.types.str;
      default = mainUser;
    };

    userGroup = lib.mkOption {
      type = lib.types.str;
      default = "users";
    };

    configBase = lib.mkOption {
      type = lib.types.str;
      default = "/mnt/hdd0/.backups/config";
    };

    defaultSchedule = lib.mkOption { 
        type = lib.types.str;
        default = "weekly";
    };

    defaultPruneWeekly = lib.mkOption {
        type = lib.types.int;
        default = 3;
    };

    defaultPruneMonthly = lib.mkOption {
        type = lib.types.int;
        default = 1;
    };

    defaultCompression = lib.mkOption {
        type = lib.types.str; 
        default = "auto,zstd"; 
    };

    defaultNotify = lib.mkOption { 
        type = lib.types.bool;
        default = true;
    };

    defaultCalcSize = lib.mkOption {
        type = lib.types.bool; 
        default = true;
    };

    defaultDelay = lib.mkOption { 
        type = lib.types.str; 
        default = "30";
    };

    mkJob = lib.mkOption {
      type = lib.types.functionTo lib.types.attrs;
      description = "Функция для создания borg-job";
    };
  };

  config.borgJobs.mkJob = mkBorgJob;
}
