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
}
