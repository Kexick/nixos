{pkgs, ...}: {
  imports = [
    ./anime-launcher.nix
    ./neovide.nix
  ];
  home.packages = with pkgs; [
    ayugram-desktop
    nemo
    ranger
    neovim
  ];
}
