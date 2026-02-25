{pkgs, ...}: {
  programs.eww = {
    enable = true;
  };

  home.packages = with pkgs; [
    translate-shell
    ffmpegthumbnailer
    ffmpeg
    mpb
    mpc
  ];
}
