{pkgs, ...}: {
  home.packages = with pkgs; [
    quickshell
    qt6Packages.qtdeclarative
    qt6Packages.qttools
  ];
  home.sessionVariables.QT_PLUGIN_PATH = "${pkgs.qt6.qtimageformats}/${pkgs.qt6.qtbase.qtQmlPrefix}";
}
