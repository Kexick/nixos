{ config, lib, pkgs, ... }:

let
  mainUser = let
    users = lib.filterAttrs (_: v: v.uid == 1000) config.users.users;
  in builtins.head (builtins.attrNames users);

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
        "${config.borgJobs.configBase}/global.txt"
        "${config.borgJobs.configBase}/${name}.txt"
      ]
    }:

    let
      patternsArgs =
        lib.concatStringsSep "\n" (map (p: "--patterns-from ${p}") patterns);

      notifyCmd =
        if notify then ''
          if [ "\${SERVICE_RESULT}" != "success" ]; then
            ${pkgs.libnotify}/bin/notify-send "Borg (${name})" "Ошибка";
          else
            ${lib.optionalString calcSize ''
              LATEST=$(${pkgs.borgbackup}/bin/borg list ${repo} --last 1 --format "{archive}{NL}")
              SIZE=$(${pkgs.borgbackup}/bin/borg info ${repo}::$LATEST --json | ${pkgs.jq}/bin/jq -r '.archives[0].stats.compressed_size')
              ${pkgs.libnotify}/bin/notify-send "Borg (${name})" "Готово. Размер: $SIZE байт"
            ''}
          fi
        '' else "";
    in
    {
      paths = [ "/" ];
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

      user = config.borgJobs.userName;
      group = config.borgJobs.userGroup;

      serviceConfig.ExecStartPost = notifyCmd;
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

    defaultSchedule = lib.mkOption { type = lib.types.str; default = "weekly"; };
    defaultPruneWeekly = lib.mkOption { type = lib.types.int; default = 3; };
    defaultPruneMonthly = lib.mkOption { type = lib.types.int; default = 1; };
    defaultCompression = lib.mkOption { type = lib.types.str; default = "auto,zstd"; };
    defaultNotify = lib.mkOption { type = lib.types.bool; default = true; };
    defaultCalcSize = lib.mkOption { type = lib.types.bool; default = true; };
    defaultDelay = lib.mkOption { type = lib.types.str; default = "2min"; };

    mkJob = lib.mkOption { type = lib.types.attrs; };
  };

  config.borgJobs.mkJob = mkBorgJob;
}
