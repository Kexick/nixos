{
  programs.nvf.settings.vim.luaConfigPost = ''
      vim.api.nvim_set_hl(0, "hl-IblIndent", { fg = "#00ff7f" })
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ff0faf" })
      vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#5fd7ff" })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#a8a8a8" })
    '';
}
