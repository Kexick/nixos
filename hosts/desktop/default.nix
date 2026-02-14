{...}: {
  imports = [
    ./hardware.nix
    ./mounts.nix
    ../../modules/core
    ../../modules/desktop
    ../../modules/hardware
    ../../modules/programs
    ../../modules/services
  ];
}
