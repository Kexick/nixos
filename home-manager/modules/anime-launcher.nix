
  let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
      url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
      sha256 = "1xyizkr8warsmlrgvh79kp4slh3jyzh54wppzsbx06j3dgvq9773";
    } );
in
{
  home.packages = [ aagl-gtk-on-nix.an-anime-game-launcher ];
}

