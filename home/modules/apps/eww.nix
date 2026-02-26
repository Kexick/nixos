{pkgs, ...}: {
  programs.eww = {
    enable = true;
  };

  home.packages = with pkgs; [
    translate-shell
    ffmpegthumbnailer
    ffmpeg
    mpd
    mpc
    mpdris2
    kdePackages.kdeconnect-kde
    kdePackages.krfb
  ];
  services.mpd = {
    enable = true;
    musicDirectory = "/home/kexick/music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };
}
