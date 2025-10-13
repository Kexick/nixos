{ pkgs, ... }:

{
  programs.nvf.settings = {
    vim.options.signcolumn = "yes";
    vim.luaConfigRC.diagnostics = ''
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      })
    '';
  };
  programs.nvf.settings.vim.languages = {
    markdown = { 
      enable = true;
      extensions = {
        markview-nvim.enable = true;
        render-markdown-nvim.enable = true;
      };
    };
    enableFormat = true;
    nix = {
      enable = true;
      format = {
        enable = true;
        type   = "nixfmt";
      };
      lsp = {
        enable = true;
        server = "nixd";
      };
      treesitter.enable = true;
    };
    css = {
      enable = true;
      format = {
        enable  = true;
        package = pkgs.nodePackages.prettier;
      };
      lsp.enable        = true;
      treesitter.enable = true;
    };
    clang = {
      enable = true;
      lsp.enable = true;
      dap.enable = true;
      cHeader = true;
      treesitter.enable = true; 
      lsp.package = [
        "${pkgs.clang-tools}/bin/clangd"
        "--ebable-config"
        "--query-driver=/nix/store/*/bin/clang,/nix/store/*/bin/clang++,/nix/store/*/bin/gcc,/nix/store/*/bin/g++"
      ];
    };
  };
}
