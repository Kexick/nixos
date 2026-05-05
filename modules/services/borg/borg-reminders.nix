{
  config,
  pkgs,
  ...
}: {
  systemd.services.borg-reminder-monthly = {
    description = "Monthly borg maintenance reminder";
    serviceConfig = {
      Type = "oneshot";
      User = config.borgJobs.userName;
      Group = config.borgJobs.userGroup;
    };
    environment.HOME = "/home/${config.borgJobs.userName}";
    script = ''
      BUS="/run/user/$(id -u)/bus"
      if [ -S "$BUS" ]; then
        export XDG_RUNTIME_DIR="/run/user/$(id -u)"
        export DBUS_SESSION_BUS_ADDRESS="unix:path=$BUS"
        ${pkgs.libnotify}/bin/notify-send \
          -a "Borg-reminder" \
          -u critical \
          -t 0 \
          "Borg monthly reminder" \
          "Проверить все чувствительные данные на наличие и восстановливаемость: Keepass, Aegis export"
      fi
    '';
  };

  systemd.timers.borg-reminder-monthly = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "monthly";
      Persistent = true;
    };
  };

  systemd.services.borg-reminder-quarterly = {
    description = "Quarterly borg recovery test reminder";
    serviceConfig = {
      Type = "oneshot";
      User = config.borgJobs.userName;
      Group = config.borgJobs.userGroup;
    };
    environment.HOME = "/home/${config.borgJobs.userName}";
    script = ''
      BUS="/run/user/$(id -u)/bus"
      if [ -S "$BUS" ]; then
        export XDG_RUNTIME_DIR="/run/user/$(id -u)"
        export DBUS_SESSION_BUS_ADDRESS="unix:path=$BUS"
        ${pkgs.libnotify}/bin/notify-send \
          -a "Borg-reminder" \
          -u critical \
          -t 0 \
          "Borg quarterly reminder" \
          "Сделать тестовое восстановление всех чувствительных данных со всех репозиториев"
      fi
    '';
  };

  systemd.timers.borg-reminder-quarterly = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "quarterly";
      Persistent = true;
    };
  };
}
