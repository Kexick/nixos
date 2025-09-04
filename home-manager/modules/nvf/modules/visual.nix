{
  programs.nvf.settings.vim = {
    visuals = {
      indent-blankline = {
        enable = true;
        setupOpts = {
          scope = {
            enabled = true;
            highlight = "IblScope";
          };
          exclude = {
            filetypes = [ "dashboard" "alpha" "lazy" "help" "neo-tree" ];
            buftypes  = [ "terminal" "nofile" ];
          };
        };
      };
      nvim-web-devicons.enable = true;
    };
  };
}
