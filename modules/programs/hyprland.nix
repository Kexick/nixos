{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    hyprlandPlugins.hyprspace
    hyprcursor
    hyprls
    hyprlock
    hyprpaper
    hyprshot
    mpvpaper
    swww
    grim
    slurp
    satty
    dunst
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

  security.pam.services.hyprlock = {
    enable = true;
  };
}
