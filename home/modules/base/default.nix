{pkgs, ...}: {
  imports = [
    ./cli/clock-rs.nix
    ./shell/shell.nix
  ];
  home.packages = with pkgs; [
    tree
  ];
}
