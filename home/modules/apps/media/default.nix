{pkgs, ...}: {
  home.packages = with pkgs; [
    termusic
    easyeffects
    media-downloader
    obs-studio
  ];
}
