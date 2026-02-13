{
  lib,
  config,
  moduleLib,
  ...
}: let
  cfg = config.module.core;
in {
  options.module.core.enable = lib.mkEnableOption "Enable NixOs core module";
  config = lib.mkIf cfg.enable {
    imports = moduleLib.importNixModules ./.;
  };
}
