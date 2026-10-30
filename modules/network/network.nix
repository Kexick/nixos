{pkgs, ...}: {
  environment.systemPackages = [pkgs.proxychains-ng];
  networking = {
    hostName = "nixos";
    networkmanager = 
      {
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
    nftables.enable = true;
    firewall = {
      extraInputRules = ''
        iifname "enp42s0" ip saddr 192.168.0.0/24 tcp dport 22000 accept
        iifname "enp42s0" ip saddr 192.168.0.0/24 udp dport 22000 accept
        tcp dport 22000 drop
        udp dport 22000 drop
      '';
    };
  };
  services.resolved = {
    enable = true;
      settings.Resolve = {
        enable = true;
        llmnr = "false";
      };
  };
}
