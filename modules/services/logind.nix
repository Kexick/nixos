{
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "ignore";
    powerKey = "suspend";
    extraConfig = ''
      IdleAction=suspend-then-hibernate
      IdleActionSec=10min
      HibernateDelaySec=2h
    '';
  };
}
