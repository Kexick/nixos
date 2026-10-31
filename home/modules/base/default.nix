{pkgs, ...}: {
  imports = [
    ./shell/shell.nix
    ./shell/tmux.nix
    ./shell/ssh.nix
    ./shell/cli/yazi.nix
    ./shell/cli/packages.nix
  ];
}
