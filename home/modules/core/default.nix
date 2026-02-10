{pkgs, ...}: {
  imports = [
    ./git.nix
    ./shell.nix
  ];
  home.packeges = with pkgs; [
    tree
  ];
}
