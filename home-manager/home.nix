{ ... }:

{
  home = {
    username = "kexick";
    homeDirectory = "/home/kexick";
    stateVersion = "25.05";
  };

  imports = [
    ./modules/anime-launcher.nix
    ./modules/shell.nix
    ./modules/clock-rs.nix
    ./modules/nvf/default.nix
    ./modules/neovide.nix
    # ../autoimport.nix
  ];
}
