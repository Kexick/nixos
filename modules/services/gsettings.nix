{pkgs, ...}: let
  gs = pkgs.gsettings-desktop-schemas;
  gtk = pkgs.gtk3;
in {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "prismlauncher" ''
      export XDG_DATA_DIRS="${gs}/share/gsettings-schemas/${gs.name}:${gtk}/share/gsettings-schemas/${gtk.name}:$XDG_DATA_DIRS"
      exec ${pkgs.prismlauncher}/bin/prismlauncher "$@"
    '')
  ];
}
