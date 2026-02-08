{pkgs, ...}: let
  gs = pkgs.gsettings-desktop-schemas;
  gtk = pkgs.gtk3;
  realJava = "${pkgs.jdk}/bin/java";
in {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "java-with-gsettings" ''
      export XDG_DATA_DIRS="${gs}/share/gsettings-schemas/${gs.name}:${gtk}/share/gsettings-schemas/${gtk.name}:$XDG_DATA_DIRS"
      exec ${realJava} "$@"
    '')
  ];
}
