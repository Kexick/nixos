{pkgs, ...}: {
  home.packages = with pkgs; [
    tree
    fzf
    fd
    ripgrep
    calc
    atool
    btop-cuda
    python313Packages.nvidia-ml-py
    fastfetch
    cava
    chafa
    yt-dlp
    ffmpeg
    ffmpegthumbnailer
    ydotool
    imagemagick
    win2xcur
  ];
}
