{ pkgs, ... }:
{
  programs.nvf.settings.vim.languages = {
    enableFormat = true;
    nix = {
      enable = true;
      format = {
        enable = true;
        type   = "nixfmt";
      };
      lsp = {
        enable = true;
        server = "nixd";
      };
      treesitter.enable = true;
    };
    css = {
      enable = true;
      format = {
        enable  = true;
        package = pkgs.nodePackages.prettier;
      };
      lsp.enable        = true;
      treesitter.enable = true;
    };
    clang = {
      enable = true;
      lsp.enable = true;
      treesitter.enable = true; 
    };
  };
}
