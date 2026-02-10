{pkgs, ...}: {
  home.packages = with pkgs; [
    ayugram-desktop
    nemo
    ranger
    neovim
  ];
}
