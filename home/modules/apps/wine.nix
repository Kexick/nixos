{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      protonup-rs
      cabextract
      winetricks
      wineWow64Packages.waylandFull
      bottles
      faudio
      vulkan-tools
    ];
    sessionVariables = {
      WINEPREFIX = "${config.home.homeDirectory}/.wine";
      WINEDEBUG = "-all";
      WINE = "${pkgs.wineWow64Packages.waylandFull}/bin/wine";
      WINESERVER = "${pkgs.wineWow64Packages.waylandFull}/bin/wineserver";
    };
  };
}
