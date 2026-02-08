{...}: {
  home = {
    username = "kexick";
    homeDirectory = "/home/kexick";
    stateVersion = "25.05";
  };

  imports = [
    ./modules/apps/anime-launcher.nix
    ./modules/apps/clock-rs.nix
    ./modules/apps/neovide.nix
    ./modules/core/git.nix
    ./modules/core/shell.nix
    ./modules/desktop/hypr/hypridle.nix
    ./modules/desktop/hypr/hyprland-plugins.nix
    ./modules/tools/mangohud.nix
  ];
}
