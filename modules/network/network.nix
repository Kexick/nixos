{pkgs, ...}: {
  environment.systemPackages = [pkgs.proxychains-ng];
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      settings.connection = {
        "connection.llmnr" = 0;
        "connection.mdns" = 0;
      };
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
    settings.Resolve = {
      enable = true;
      LLMNR = "false";
      MulticastDNS = "false";
    };
  };
}
