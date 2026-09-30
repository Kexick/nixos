{
  inputs,
  pkgs,
  ...
}:let
  gloview = inputs.gloview.packages.${pkgs.stdenv.hostPlatform.system}.gloview;
  noshare-cover = inputs.noshare-cover.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  environment = {
  sessionVariables = {
    NOSHARE_COVER = "${noshare-cover}/lib/libnoshare-cover.so";
    GLOVIEW = "${gloview}/lib/libgloview.so";
  };
    systemPackages = with pkgs; [
    # hyprlandPlugins.hyprspace
    hyprcursor
    hyprpicker
    hyprshutdown
    # hyprls
    hyprlock
    hyprpaper
    hyprshot
    mpvpaper
    awww
    grim
    slurp
    satty
    dunst
  ];
  };
  xdg.portal = {
    enable = true;
    extraPortals = [
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
