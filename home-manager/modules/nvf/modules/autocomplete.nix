{ pkgs, ... }:
{
  programs.nvf.settings.vim.autocomplete = {
    blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      setupOpts.signature.enabled = true;
      sourcePlugins = {
        path = {
          enable = true;
          package = pkgs.vimPlugins.cmp-path;
          module = "cmp_path";
        };
      };
    };
    enableSharedCmpSources = true;
  };
}
