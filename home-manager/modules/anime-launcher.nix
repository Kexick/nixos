
  let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
      url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
      sha256 = "0qgssqk204klhq3i1qbgbk3wp8izqzgc7rsy7626kksbd709ndpl";
    } );
in
{
  home.packages = [ aagl-gtk-on-nix.an-anime-game-launcher ];
}

