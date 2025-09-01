{
  programs.nvf.settings.vim.lsp = {
    enable = true;
    formatOnSave = false;
    servers = {
      qmlls = {
        enable    = true;
        cmd       = [ "qmlls" ];
        filetypes = [ "qml"   ];
         settings  = {
          qmlls.profile        = "Qt6";
          qmlls.qmlImportPaths = [ "$QML_IMPORT_PATH" ];
        };
      };
      hyprls = {
        enable    = true;
        cmd       = [ "hyprls" ];
        filetypes = [
          "hyprlang"
        ];
        root_dir  = ''
          function(fname)
                return vim.fn.getcwd()
              end'';
      };
    };
  };
}
