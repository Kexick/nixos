{moduleLib, ...}: {
  imports =
    [
      ./env.nix
      ./hardware.nix
      ./mounts.nix
    ]
    ++ moduleLib.importNixModules ../../modules;
}
