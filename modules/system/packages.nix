{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    unzip
    p7zip
    jq
    gnumake
    home-manager
    nh
    btrfs-progs
    sshfs
    alsa-utils
  ];
}
