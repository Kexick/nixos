{pkgs, ...}: {
  home.packages = with pkgs; [
    gvfs
    glib
    ouch
    trash-cli
    lazygit
    mediainfo
  ];
  programs.yazi = {
    enable = true;
    plugins = {
      full-border.package = pkgs.yaziPlugins.full-border;
      clip.package        = pkgs.yaziPlugins.clipboard;
      mediainfo.package   = pkgs.yaziPlugins.mediainfo;
      lazygit.package     = pkgs.yaziPlugins.lazygit;
      convert.package     = pkgs.yaziPlugins.convert;
      ouch.package        = pkgs.yaziPlugins.ouch;
      zoom.package        = pkgs.yaziPlugins.zoom;
      mount.package       = pkgs.yaziPlugins.mount;
      restore = {
        package = pkgs.yaziPlugins.restore;
        setup = true;
      };
      bookmarks = {
        package = pkgs.yaziPlugins.bookmarks;
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
          on  = "y";
          run = [ "yank" "plugin clip -- --action=copy" ];
          desc = "Yank selected files (copy)";
        }
        {
          on  = "x";
          run = [ "yank --cut" "plugin clip -- --action=copy" ];
          desc = "Yank selected files (cut)";
        }
        {
          on  = "<C-p>";
          run = [ "plugin clip -- --action=paste" ];
          desc = "Paste yanked system clip files";
        }
        {
          on = [ "g" "i" ];
          run = "plugin lazygit";
          desc = "run lazygit";
        }
        {
          on = ["c" "p"];
          run = "plugin convert -- --extension='png'";
          desc = "[PNG] Convert";
        }
        {
          on = ["c" "j"];
          run = "plugin convert -- --extension='jpg'";
          desc = "[JPG] Convert";
        }
        {
          on = ["c" "w"];
          run = "plugin convert -- --extension='webp'";
          desc = "[WEBP] Convert";
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
          on = [ "C" ];
          run = "plugin ouch";
          desc = "Compress with ouch";
        }
        {
          on = [ "+" ];
          run = "plugin zoom 1";
          desc = "Zoom in hovered file";
        }
        {
          on = [ "-" ];
          run = "plugin zoom -1";
          desc = "Zoom out hovered file";
        }
        {
          on = [ "M" ];
          run = "plugin mount";
          desc = "Mount device";
        }
        {
          on = [ "<Enter>"];
          run = "enter";
        }
        {
          on = [ "B" ];
          run = "plugin bookmarks all_bookbarks";
          desc = "Jump to a bookmark";
        }
        {
          on = [ "'" ];
          run = "plugin bookmarks jump";
          desc = "Jump to a bookmark";
        }
        {
          on = [ "m" ];
          run = "plugin bookmarks save";
          desc = "Save current position as a bookmark";
        }
        {
          on = [ "b" "d" ];
          run = "plugin bookmarks delete";
          desc = "Delete a bookmark";
        }
        {
          on = [ "b" "D" ];
          run = "plugin bookmarks delete_all";
          desc = "Delete all bookmark";
        }
      ];
    };
    initLua = ''
     require("full-border"):setup {
        type = ui.Border.ROUNDED,
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
        prepend_preloaders = [
        { mime = "{audio,video,image}/*"; run = "mediainfo"; }
        { mime = "application/{subrip,postscript,illustrator,dvb.ait,vnd.adobe.illustrator,eps}"; run = "mediainfo"; }
        { url = "*.{ai,eps,ait}"; run = "mediainfo"; }
        { mime = "{image}/*"; run = "mediainfo --no-metadata"; }
        { mime = "{video}/*"; run = "mediainfo --no-preview"; }
        ];
        prepend_previewers = [
        { mime = "image/{jpeg,png,webp}"; run  = "zoom 5"; }
        { mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}"; run = "ouch"; }
        { url = "*.{ai,eps,ait}"; run = "mediainfo"; }
        { mime = "{audio,video,image}/*"; run = "mediainfo"; }
        { mime = "application/{subrip,postscript,illustrator,dvb.ait,vnd.adobe.illustrator,eps}"; run = "mediainfo"; }
        { mime = "{image}/*"; run = "mediainfo --no-metadata"; }
        { mime = "{video}/*"; run = "mediainfo --no-preview"; }
      ];
      };
      preview = {
        image_protocol = "kitty";
        image_filter = "nearest";
        max_width  = 10000;
        max_height = 10000;
      };
      tasks = {
       image_alloc = 1073741824;
      };
    };
  };
}
