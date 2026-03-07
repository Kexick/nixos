{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    winetricks
    wineWowPackages.waylandFull
    bottles
  ];
  home.sessionVariables = {
    WINEPREFIX = "${config.home.homeDirectory}/.wine";
    WINEARCH = "win";
    WINEDEBUG = "-all";
    WINE = "${pkgs.wineWowPackages.waylandFull}/bin/wine";
    WINESERVER = "${pkgs.wineWowPackages.waylandFull}/bin/wineserver";
  };
}
