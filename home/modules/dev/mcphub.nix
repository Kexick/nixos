{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.mcp-hub.packages."${pkgs.stdenv.hostPlatform.system}".default
    uv
    nodejs
  ];
}
