{
  inputs,
  pkgs,
  hyprland-plugins,
  hyprspace,
  ...
}: let
  hp = hyprland-plugins.packages.${pkgs.system};
in {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = [
    # hyprspace.packages.${pkgs.system}.default
    # pkgs.hyprland-qtutils
    # hp.hyprexpo
    pkgs.hyprlandPlugins.hyprspace
    pkgs.hyprcursor
    pkgs.hyprls
    pkgs.hyprpaper
    pkgs.hyprshot
    pkgs.mpvpaper
    pkgs.swww
    pkgs.grim
    pkgs.slurp
    pkgs.satty
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = ["hyprland" "gtk"];
        "org.freedesktop.portal.FileChooser" = ["gtk"];
        "org.freedesktop.portal.ScreenCast" = ["hyprland"];
        "org.freedesktop.portal.Screenshot" = ["hyprland"];
        "org.freedesktop.portal.RemoteDesktop" = ["hyprland"];
      };
    };
  };

  services.gvfs.enable = true;
}
