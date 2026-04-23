{...}: {
  systemd = {
    sleep.extraConfig = ''
      AllowSuspend=yes
      AllowHibernation=yes
      AllowSuspendThenHibernate=yes
      SuspendState=mem
      HibernateDelaySec=1h
    '';
    oomd.enable = true;
  };
}
