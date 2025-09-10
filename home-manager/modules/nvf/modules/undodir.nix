{ config, ... }:
{
  programs.nvf.settings.vim.undoFile = {
    enable = true;
    path = "${config.xdg.cacheHpme}/nvf/undo";
  };
}
