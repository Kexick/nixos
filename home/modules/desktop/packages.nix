{pkgs, ...}: {
  home.packages = with pkgs; [
    walker
    elephant # for walker
    xdg-utils
    libnotify
    playerctl

    libheif.bin
    libheif.out
    python313Packages.nvidia-ml-py
    qt5.qtgraphicaleffects
  ];
}
