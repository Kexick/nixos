{moduleLib, ...}: {
  imports =
    [
      ./hardware.nix
      ./mounts.nix
    ]
    ++ moduleLib.importNixModules ../../modules;
}
