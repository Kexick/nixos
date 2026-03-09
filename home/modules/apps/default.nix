{pkgs, ...}: {
  imports = [
    ./eww.nix
    ./wine.nix
    ./alacritty.nix
    ./foot.nix
  ];
  home.packages = with pkgs; [
    nemo
    ayugram-desktop
    wf-recorder
    obs-studio
  ];
}
