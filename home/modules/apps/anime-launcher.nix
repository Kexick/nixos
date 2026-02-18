let
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "1zvj4a1qly9kpvawinrabyak3g70p02dkqbl8pdd2z4icc4jha5l";
  });
in {
  home.packages = [aagl-gtk-on-nix.an-anime-game-launcher];
}
