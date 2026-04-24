{pkgs, ...}: {
  environment.systemPackages = [pkgs.proxychains-ng];
  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    nameservers = ["1.1.1.1" "8.8.8.8"];
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
  services.resolved.enable = true;
}
