{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.mcp-hub.packages."${pkgs.system}".default
  ];
}
