{ pkgs ? import <nixpkgs> {} }:

pkgs.buildFHSEnv {
  name = "discord";
  targetPkgs = pkgs: [
     pkgs.glibc
     pkgs.glib
     pkgs.nspr
     pkgs.nss
     pkgs.openssl
     pkgs.curl
     pkgs.file
     pkgs.which
     pkgs.mesa 
     pkgs.libgbm
     pkgs.expat
     pkgs.libxkbcommon
     pkgs.libudev-zero
     pkgs.alsa-lib

    # X11 (через XWayland)
    pkgs.xorg.libX11
    pkgs.xorg.libXrandr
    pkgs.xorg.libXfixes
    pkgs.xorg.libXcomposite
    pkgs.xorg.libXdamage
    pkgs.xorg.libXrender
    pkgs.xorg.libXi
    pkgs.xorg.libXtst
    pkgs.xorg.libXext
    pkgs.xorg.libxcb
    pkgs.xorg.xorgproto

    # GUI / GTK / шрифты
    pkgs.gtk3
    pkgs.cairo
    pkgs.pango
    pkgs.atk
    pkgs.libepoxy
    pkgs.fontconfig
    pkgs.freetype
    pkgs.shared-mime-info
    pkgs.libjpeg_turbo

    # Прочее
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk
    pkgs.pulseaudio
    pkgs.libnotify
    pkgs.libcap
    pkgs.dbus
    pkgs.wireplumber
    pkgs.libsForQt5.xwaylandvideobridge
    ];

  multiPkgs = pkgs: [];

  runScript = ''
    # export $HOME=/home/kexick
    # export XDG_DATA_HOME="$HOME/.local/share"
    # export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_RUNTIME_DIR=/run/user/$(id -u)
    export PULSE_SERVER=unix:$XDG_RUNTIME_DIR/pulse/native
    export PIPEWIRE_REMOTE=unix:$XDG_RUNTIME_DIR/pipewire-0
    export DISCORD_DISABLE_HARDWARE_ACCELERATION=1
    #
    # # Прокси
    export HTTP_PROXY="http://127.0.0.1:1080"
    export HTTPS_PROXY="http://127.0.0.1:1080"
    export http_proxy="$HTTP_PROXY"
    export https_proxy="$HTTPS_PROXY"
    export all_proxy="socks5h://127.0.0.1:1080"
    export NO_PROXY="localhost,127.0.0.1"


    # Отключаем аппаратное ускорение

    LD_LIBRARY_PATH для критических библиотек
    export LD_LIBRARY_PATH="
      ${pkgs.mesa}/lib:
      ${pkgs.libxkbcommon}/lib:
      ${pkgs.alsa-lib}/lib:
      ${pkgs.pulseaudio}/lib:
      $LD_LIBRARY_PATH
    "

    exec /home/kexick/discord/Discord/Discord
  '';
}
