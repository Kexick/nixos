{ pkgs, ... }:
{
  home.packages = with pkgs; [ripgrep];
  programs.nvf.settings.vim.telescope = {
    enable = true;
    extensions = [
      {
        name = "file_browser";
        packages = [pkgs.vimPlugins.telescope-file-browser-nvim];
        setup.file_browser = {
          git_status        = true;
          hijack_netrw      = true;
          grouped           = true;
          respect_gitignore = true;
          hidden            = true;
          initial_mode      = "normal";
        };
      }
      {
        name = "media_files";
        packages = [pkgs.vimPlugins.telescope-media-files-nvim];
        setup.media_files = {
          filetypes = [ "png" "jpg" "mp4" "jpeg" ];
          find_cmd = "rg";
        };
      }
    ];
  };
}
