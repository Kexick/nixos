
  let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
      url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
      sha256 = "1pi18grynxv45kigrlmphkmq527hw85b7cgbz8mqvpw79ndj9yj5";
    } );
in
{
  home.packages = [ aagl-gtk-on-nix.an-anime-game-launcher ];
}

