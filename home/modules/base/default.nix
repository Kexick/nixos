{pkgs, ...}: {
  imports = [
    ./shell/shell.nix
    ./shell/tmux.nix
    ./shell/ssh.nix
    ./yazi.nix
  ];
  home.packages = with pkgs; [
    tree
    gvfs
    glib
    ouch
    trash-cli
    lazygit
  ];
  nixpkgs.config.allowUnfree = true;
}
