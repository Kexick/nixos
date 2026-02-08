{
  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    IdleAction = "suspend-then-hibernate";
    IdleActionSec = "10min";
    HibernateDelaySec = "2h";
  };
}
