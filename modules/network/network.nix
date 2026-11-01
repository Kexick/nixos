{pkgs, ...}: {
  environment.systemPackages = [pkgs.proxychains-ng];
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
      "9.9.9.9"
      "94.140.14.14"
    ];
  };
  services.resolved = {
    enable = true;
    settings.Resolve = {
      enable = true;
      llmnr = "false";
    };
  };
}
