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
    wlroots
    gamemode
    avfs
    atool
    adwaita-icon-theme
    alsa-utils
    btop-cuda
    # cargo
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
    wineWowPackages.waylandFull
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
    xray
    youtube-music
    zen.packages.${pkgs.system}.default
    zsh-powerlevel10k
  ];

  fonts.packages = with pkgs; [
    dina-font
    dejavu_fonts
    fira-code
    fira-code-symbols
    hack-font
    liberation_ttf
    mplus-outline-fonts.githubRelease
    nerd-fonts.droid-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    proggyfonts
    roboto-mono
    ubuntu-sans
    ubuntu-sans-mono
    vista-fonts
  ];

}
