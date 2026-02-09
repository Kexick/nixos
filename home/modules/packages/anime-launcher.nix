let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "137rfwkqyf0s05fvivl9z1n3dnwws5h7mybp76hgga8y6p0bxm2q";
  });
in {
  home.packages = [aagl-gtk-on-nix.an-anime-game-launcher];
}
