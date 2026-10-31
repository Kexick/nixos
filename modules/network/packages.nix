{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    iptables
    ipset
    nftables
    xray
  ];
}
