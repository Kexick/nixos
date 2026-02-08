{...}: {
  home = {
    username = "kexick";
    homeDirectory = "/home/kexick";
    stateVersion = "25.05";
  };

  imports = [
    ./modules/core/git.nix
    ./modules/core/shell.nix
    ./modules/desktop/anime-launcher.nix
    ./modules/desktop/clock-rs.nix
    ./modules/desktop/hypridle.nix
    ./modules/desktop/hyprland-plugins.nix
    ./modules/desktop/mangohud.nix
    ./modules/desktop/neovide.nix
  ];
}
