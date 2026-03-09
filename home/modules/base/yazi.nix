{...}: {
  programs.yazi = {
    enable = true;
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
      preview = {
        image_protocol = "kitty";
        image_filter = "nearest";
      };
    };
  };
}
