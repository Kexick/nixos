let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "19d1a4x3kcdzi0w8bzll8ws3hpnz3nrxdknc8vsrpyngbp3ws8ik";
  });
in {
  home.packages = [aagl-gtk-on-nix.an-anime-game-launcher];
}
