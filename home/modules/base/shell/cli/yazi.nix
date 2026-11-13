{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    gvfs
    glib
    ouch
    trash-cli
    lazygit
    mediainfo
    ffmpeg
    imagemagick
  ];
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    plugins = {
      full-border.package = pkgs.yaziPlugins.full-border;
      clip.package = pkgs.yaziPlugins.clipboard;
      mediainfo.package = pkgs.yaziPlugins.mediainfo;
      lazygit.package = pkgs.yaziPlugins.lazygit;
      ouch.package = pkgs.yaziPlugins.ouch;
      zoom.package = pkgs.yaziPlugins.zoom;
      mount.package = pkgs.yaziPlugins.mount;
      chmod.package = pkgs.yaziPlugins.chmod;
      git = {
        setup = true;
        package = pkgs.yaziPlugins.git;
      };
      image-convert = {
        package = inputs.yazi-plugins + "/image-convert.yazi";
        setup = true;
        settings = {
          strip = true;
        };
      };
      video-convert = {
        package = inputs.yazi-plugins + "/video-convert.yazi";
        setup = true;
        settings = {
          gif = {
            fps = "18";
          };
        };
      };
      restore = {
        package = pkgs.yaziPlugins.restore;
        setup = true;
      };
      bookmarks = {
        package = inputs.yazi-plugins + "/bookmarks.yazi";
        setup = true;
        settings = {
          last_directory = {
            enable = false;
            persist = false;
            mode = "dir";
          };
          persist = "all";
          desc_format = "full";
          file_pick_mode = "hover";
          custom_desc_input = false;
          show_keys = false;
          notify = {
            enable = false;
            timeout = 1;
            message = {
              new = "New bookmark '<key>' -> '<folder>'";
              delete = "Deleted bookmark in '<key>'";
              delete_all = "Deleted all bookmarks";
            };
          };
        };
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = "<C-m>";
          run = ["plugin chmod"];
          decs = "Chmod on selected file";
        }
        {
          on = "y";
          run = ["yank" "plugin clip -- --action=copy"];
          desc = "Yank selected files (copy)";
        }
        {
          on = "x";
          run = ["yank --cut" "plugin clip -- --action=copy"];
          desc = "Yank selected files (cut)";
        }
        {
          on = "<C-p>";
          run = ["plugin clip -- --action=paste"];
          desc = "Paste yanked system clip files";
        }
        {
          on = ["g" "i"];
          run = "plugin lazygit";
          desc = "run lazygit";
        }
        {
          on = ["c" "i"];
          run = "plugin image-convert";
          desc = "Convert image";
        }
        {
          on = ["u"];
          run = "plugin restore";
          desc = "Restore last deleted files/folders";
        }
        {
          on = ["U"];
          run = "plugin restore -- --interactive";
          desc = "Restore deleted files/folders (Interactive)";
        }
        {
          on = ["C"];
          run = "plugin ouch";
          desc = "Compress with ouch";
        }
        {
          on = ["+"];
          run = "plugin zoom 1";
          desc = "Zoom in hovered file";
        }
        {
          on = ["-"];
          run = "plugin zoom -1";
          desc = "Zoom out hovered file";
        }
        {
          on = ["M"];
          run = "plugin mount";
          desc = "Mount device";
        }
        {
          on = ["<Enter>"];
          run = "enter";
        }
        {
          on = ["'"];
          run = "plugin bookmarks jump";
          desc = "Jump to a bookmark";
        }
        {
          on = ["m"];
          run = "plugin bookmarks save";
          desc = "Save current position as a bookmark";
        }
        {
          on = ["b" "d"];
          run = "plugin bookmarks delete";
          desc = "Delete a bookmark";
        }
        {
          on = ["b" "D"];
          run = "plugin bookmarks delete_all";
          desc = "Delete all bookmark";
        }
        {
          on = ["c" "v"];
          run = "plugin video-convert";
          desc = "Convert video file";
        }
      ];
    };
    initLua = ''
      require("full-border"):setup {
         set = "rounded"
       }
    '';
    settings = {
      log = {
        enabled = false;
      };
      mgr = {
        ratio = [0 3 5];
        show_hidden = false;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
        scrolloff = 7;
      };

      plugin = {
        prepend_fetchers = [
          {
            url = "*";
            run = "git";
            group = "git";
          }
          {
            url = "*/";
            run = "git";
            group = "git";
          }
        ];
        prepend_preloaders = [
          {
            mime = "{audio,video,image}/*";
            run = "mediainfo";
          }
          {
            mime = "application/{subrip,postscript,illustrator,dvb.ait,vnd.adobe.illustrator,eps}";
            run = "mediainfo";
          }
          {
            url = "*.{ai,eps,ait}";
            run = "mediainfo";
          }
        ];
        prepend_previewers = [
          {
            mime = "image/{jpeg,png,webp}";
            run = "zoom 5";
          }
          {
            mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
            run = "ouch";
          }
          {
            url = "*.{ai,eps,ait}";
            run = "mediainfo";
          }
          {
            mime = "{audio,video,image}/*";
            run = "mediainfo";
          }
          {
            mime = "application/{subrip,postscript,illustrator,dvb.ait,vnd.adobe.illustrator,eps}";
            run = "mediainfo";
          }
        ];
      };
      preview = {
        image_protocol = "kitty";
        image_filter = "nearest";
        max_width = 10000;
        max_height = 10000;
      };
      tasks = {
        image_alloc = 1073741824;
      };
    };
  };
}
