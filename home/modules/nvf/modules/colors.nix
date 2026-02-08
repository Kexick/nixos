{
  programs.nvf.settings.vim.luaConfigPost = ''
      vim.api.nvim_set_hl(0, "hl-IblIndent",    { fg = "#00ff7f" })
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ff0faf" })
      vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#5fd7ff" })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#a8a8a8" })
      vim.api.nvim_set_hl(0, "DashboardRed",    { fg = "#ff5f5f" })
      vim.api.nvim_set_hl(0, "DashboardBlue",   { fg = "#5fd7ff" })
      vim.api.nvim_set_hl(0, "DashboardGreen",  { fg = "#00ff87" })
      vim.api.nvim_set_hl(0, "DashboardYellow", { fg = "#00ffff" })
      vim.api.nvim_set_hl(0, "DashboardBlack",  { fg = "#ffffff" })

      local fb = require("telescope").extensions.file_browser
        local action_state = require("telescope.actions.state")
        local actions = require("telescope.actions")

        function _G.create_new_file_with_browser()
          fb.file_browser({
            prompt_title = "New file",
            select_buffer = true,
            attach_mappings = function(prompt_bufnr, map)
              local function enter()
                local entry = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                -- entry[1] это путь, добавляем имя файла
                vim.ui.input({ prompt = "Filename: " }, function(input)
                  if not input or input == "" then return end
                  local path = entry[1] .. "/" .. input
                  vim.cmd("edit " .. path)
                end)
              end
              map("i", "<CR>", enter)
              map("n", "<CR>", enter)
              return true
            end,
          })
        end
    '';
}
