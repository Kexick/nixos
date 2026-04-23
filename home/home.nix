{...}: {
  home = {
    username = "kexick";
    homeDirectory = "/home/kexick";
    stateVersion = "25.05";
  };
  news.display = "silent";

  imports = [
    ./modules/apps/default.nix
    ./modules/base/default.nix
    ./modules/dev/default.nix
    ./modules/desktop/default.nix
  ];
}
