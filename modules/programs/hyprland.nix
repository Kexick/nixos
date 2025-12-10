{
  pkgs,
  hyprland-plugins,
  hyprspace,
  ...
}:
let
  hp = hyprland-plugins.packages.${pkgs.system};
in
{
  programs.hyprland.enable = true;
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
  ];
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config = {
        common.default = [ "hyprland" "gtk" ];
    };
  };
}
