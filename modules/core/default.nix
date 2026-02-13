{
  lib,
  config,
  ...
}: let
  cfg = config.module.core;
in {
  options.module.core.enable = lib.mkEnableOption "Enable NixOs core module";
  config = lib.mkIf cfg.enable {
    imports = [
      ./state.nix
      ./user.nix
      ./gc.nix
      ./env.nix
      ./boot.nix
      ./hosts.nix
      ./kernel.nix
      ./logging.nix
      ./network.nix
      ./nixsettings.nix
    ];
  };
}
