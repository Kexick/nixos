{...}: {
  home = {
    username = "kexick";
    homeDirectory = "/home/kexick";
    stateVersion = "25.05";
  };

  imports = [
    ./modules/apps/default.nix
    ./modules/core/default.nix
    ./modules/desktop/hyprland/default.nix
    ./modules/tools/default.nix
  ];
}
