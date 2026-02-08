{
  programs.nvf.settings.vim.statusline.lualine = {
        enable = true;
        setupOpts = {
      options = {
        # globalstatus = true;
        theme = "auto";
        # always_show_tabline = true;
        component_separators = { left = ""; right = ""; };
        section_separators   = { left = ""; right = ""; };
        disabled_filetypes = { statusline = [ "dashboard" "alpha" ]; };
      };
      sections = {
        lualine_a = ["mode"]; 
        lualine_b = [ "branch" "diff" "diagnostics" ];
        lualine_c = [ "filename" ];
        lualine_x = [ "encoding" "fileformat" "filetype" ];
        lualine_y = [ "progress" "location" ];
        lualine_z = [ "os.date('%I:%M %d %b %Y')" ];
      };
    #   inactive_sections = {
    #     lualine_a = [];
    #     lualine_b = [ ''{ "os.date('%a')", 'data', "require'lsp-status'.status()" }'' ];
    #     lualine_c = ["filename"];
    #     lualine_x = ["location"];
    #     lualine_y = [];
    #     lualine_z = [];
    #     };
    #   tabline = {};
    #   winbar = {};
    #   inactive_winbar = {};
    #   extensions = {};
    #   }; 
    };
  };
}
