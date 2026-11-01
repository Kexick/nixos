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
    btrfs-progs
    sshfs
    alsa-utils
  ];
}
