{...}: {
  systemd = {
    sleep.settings.Sleep = {
      AllowSuspend = "yes";
      AllowHibernation = "yes";
      AllowSuspendThenHibernate = "yes";
      SuspendState = "mem";
      HibernateDelaySec = "1h";
    };
    oomd.enable = true;
  };
}
