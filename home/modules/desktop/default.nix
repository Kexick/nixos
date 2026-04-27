{pkgs, ...}: {
  imports = [
    ./hyprland/default.nix
    ./overlay/mangohud.nix
    ./keepassxc.nix
  ];
}
