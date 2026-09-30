{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./misc/hypridle.nix
  ];
  home.file.".config/hypr/.luarc.json".text = builtins.toJSON {
    workspace.library = [
      "${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/share/hypr/stubs"
    ];
  };
}
