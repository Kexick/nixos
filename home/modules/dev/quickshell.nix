{pkgs, ...}: {
  home.packages = with pkgs; [
    quickshell
    qt6.qtdeclarative
    qt6.qttools
    qt6.qtdoc
    qt6.qtbase
  ];
  home.sessionVariables.QT_PLUGIN_PATH = "${pkgs.qt6.qtimageformats}/${pkgs.qt6.qtbase.qtQmlPrefix}";
}
