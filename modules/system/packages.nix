{
  # quickshell,
  zen,
  pkgs,
  ...
}:
{

  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    sshfs
    hiddify-app
    yt-dlp
    webcord
    xorg.xcursorgen
    xcur2png 
    imagemagick
    win2xcur
    btrfs-progs
    kdiskmark
    ironbar
    wlroots
    syncthing
    qbittorrent
    gamemode
    avfs
    atool
    qtemu
    adwaita-icon-theme
    alsa-utils
    btop-cuda
    # cargo
    clang-tools
    cava
    chafa
    chromium
    clock-rs
    # cmake
    curl
    # eww
    fastfetch
    foot
    # gcc
    git
    # gnumake
    heroic
    home-manager
    inkscape-with-extensions
    ipset
    iptables
    # kdePackages.qtdeclarative
    libnotify
    # libsForQt5.qt5.qtdeclarative
    lutris
    mako
    mangohud
    mpv
    neovim
    nh
    nixd
    nixpkgs-fmt
    # ntfs3g
    obsidian
    osu-lazer-bin
    papirus-icon-theme
    playerctl
    gcc
    plymouth
    prismlauncher
    python313Packages.nvidia-ml-py
    # qt5.qtbase
    qt5.qtgraphicaleffects
    # quickshell.packages.${pkgs.system}.default
    ranger
    # rustc
    # swaynotificationcenter
    telegram-desktop
    testdisk
    ueberzugpp
    unzip
    vscode-langservers-extracted
    vulkan-extension-layer
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    walker
    wget
    wineWowPackages.staging
    winetricks
    # wineWowPackages.waylandFull
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
    xray
    youtube-music
    zen.packages.${pkgs.system}.default
    zsh-powerlevel10k
  ];
}
