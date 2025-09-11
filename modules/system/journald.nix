{
  services.journald.extraConfig = ''
    SystemMaxUse=500M
    SystemFileSize=50M
    MaxRetentionSex=1w
  '';
}
