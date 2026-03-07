{pkgs, ...}: {
  imports = [
    ./shell/shell.nix
    ./shell/tmux.nix
  ];
  home.packages = with pkgs; [
    tree
  ];
}
