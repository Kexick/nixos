{
  programs.nvf.settings.vim.filetree.nvimTree = {
    enable = true;
    openOnSetup = false;
    setupOpts = {
      git.enable = true;
      renderer.highlight_git = true;
      filters.dotfiles = false;
      tab.sync.close   = true;
      tab.sync.open    = true;
      renderer.indent_markers.enable = true;
      view = {
        number         = true;
        relativenumber = true;
        width = {
          max = 50;
          min = 25;
        };
      };
    };
  };
}
