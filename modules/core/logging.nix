{...}: {
  services.journald.extraConfig = ''
    SystemMaxUse=500M
    SystemFileSize=50M
    MaxRetentionSec=1week
  '';
  systemd.coredump.extraConfig = ''
    Storage=external
    ProcessSizeMax=500M
  '';
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "524288";
    }
    {
      domain = "*";
      type = "hard";
      item = "nofile";
      value = "524288";
    }
  ];
}
