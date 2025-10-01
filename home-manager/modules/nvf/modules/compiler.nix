{
  programs.nvf.settings.vim.luaConfigRC.c_compiler = ''
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "c" },
          callback = function()
            vim.cmd("compiler gcc")
            vim.bo.makeprg = "gcc -std=c11 -Wall -Wextra -Werror % -o %<"
          end,
        })
      '';
}
