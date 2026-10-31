{pkgs, ...}: {
  home.packages = with pkgs; [
    obsidian
    telegram-desktop
    qbittorrent
    kdiskmark
    inkscape-with-extensions
    mpv
    vesktop
    qtemu
    nemo
    ayugram-desktop
    wf-recorder
  ];
}
