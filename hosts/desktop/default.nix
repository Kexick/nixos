{...}: {
  imports = [
    ./hardware.nix
    ./mounts.nix
    ../../modules/core
  ];

  module.core.enable = true;
}
