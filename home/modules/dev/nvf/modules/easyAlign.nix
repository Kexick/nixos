{ pkgs, ... }:
{
  programs.nvf.settings.vim.startPlugins = [ pkgs.vimPlugins.vim-easy-align ];
}
