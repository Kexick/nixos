{pkgs, ...}: {
  imports = [
    ./shell/shell.nix
    ./shell/tmux.nix
    ./yazi.nix
  ];
  home.packages = with pkgs; [
    tree
  ];
}
