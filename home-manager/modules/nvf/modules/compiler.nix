{
  programs.nvf.settings.extraLuaConfig = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c" },
      callback = function()
        vim.cmd("compiler gcc")  -- загружает стандартный errorformat для GCC
        vim.bo.makeprg = "gcc -std=c11 -Wall -Wextra -Werror % -o %<"
      end,
    })
    vim.keymap.set("n", "<leader>m", function()
      vim.cmd("make")      -- запускает gcc
      vim.cmd("cwindow")   -- открывает quickfix‑лист, если есть ошибки
    end, { desc = "Собрать текущий C‑файл" })
  '';
}
