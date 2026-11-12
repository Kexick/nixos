{...}: {
  networking = {
    firewall = {
      enable = true;
      allowPing = false;
    };
    nftables.enable = true;
  };
}
