{ config, ... }:
{
  programs.nvf.settings.vim.undoFile = {
    enable = true;
    path = "${config.xdg.cacheHome}/nvf/undo";
  };
}
