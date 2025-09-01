
  let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
      url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
      sha256 = "0nyj3vvvapbr7x71s9f9rxkrvnq8kr4mcdid4x00v2397ia3jimg";
    } );
in
{
  home.packages = [ aagl-gtk-on-nix.an-anime-game-launcher ];
}

