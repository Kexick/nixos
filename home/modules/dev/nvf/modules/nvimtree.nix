{
  programs.nvf.settings.vim.filetree.nvimTree = {
    enable = true;
    openOnSetup = false;
    setupOpts = {
      git.enable              = true;
      tab.sync.close          = true;
      tab.sync.open           = true;
      filters.dotfiles        = false;

      renderer = {
        highlight_git         = true;
        indent_markers.enable = true;
      };
      view = {
        width = { max = 50; min = 25; };
        number         = true;
        relativenumber = true;
      };
    };
  };
}
