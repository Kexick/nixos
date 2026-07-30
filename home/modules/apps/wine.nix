{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    winetricks
    wineWow64Packages.waylandFull
    bottles
  ];
  home.sessionVariables = {
    WINEPREFIX = "${config.home.homeDirectory}/.wine";
    WINEDEBUG = "-all";
    WINE = "${pkgs.wineWow64Packages.waylandFull}/bin/wine";
    WINESERVER = "${pkgs.wineWow64Packages.waylandFull}/bin/wineserver";
  };
}
