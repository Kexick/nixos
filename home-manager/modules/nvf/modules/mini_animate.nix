{ pkgs, ... }:
{
  programs.nvf.settings.vim.extraPlugins.mini-animate = {
    package = pkgs.vimPlugins.mini-animate;
    setup =  ''
      local animate = require('mini.animate')
    local timing = animate.gen_timing.linear({ duration = 120 })
    animate.setup({
      cursor = {
        enable = true,
        timing = timing,
        path = animate.gen_path.line(),
      },
      scroll = { enable = true, timing = timing },
      open   = { enable = false },
      close  = { enable = false },
      resize = { enable = false },
    })
    vim.o.lazyredraw = false
    '';
  };
}
