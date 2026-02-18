{pkgs, ...}: {
  imports = [
    ./anime-launcher.nix
    ./eww.nix
  ];
  home.packages = with pkgs; [
    nemo
    ayugram-desktop
  ];
}
