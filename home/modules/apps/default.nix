{pkgs, ...}: {
  imports = [
    ./eww.nix
    ./wine.nix
    ./alacritty.nix
    ./foot.nix
    ./obs-studio.nix
    ./firefox.nix
    ./packages.nix
  ];
}
