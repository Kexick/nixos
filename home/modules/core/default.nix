{pkgs, ...}: {
  imports = [
    ./git.nix
    ./shell.nix
  ];
  home.packages = with pkgs; [
    tree
  ];
}
