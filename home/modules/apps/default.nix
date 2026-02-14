{pkgs, ...}: {
  imports = [
    ./anime-launcher.nix
  ];
  home.packages = with pkgs; [
    nemo
    ayugram-desktop
  ];
}
