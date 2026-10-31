{pkgs, ...}: {
  home.packages = with pkgs; [
    clang-tools
    nixd
    lua
    nixpkgs-fmt
    alejandra
    gcc
    vscode-langservers-extracted
    bash-language-server
    lua-language-server
    stylua
    luarocks
    topiary
  ];
}
