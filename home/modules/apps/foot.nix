{...}: {
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Roboto Mono:size=16,JetBrainsMono Nerd Font:size=17";
        pad = "20x20";
      };

      colors = {
        alpha = 0.46;
        background = "000000";
        foreground = "ffffff";
      };

      url = {
        launch = ''xdg-open ''${url}'';
      };

      cursor = {
        style = "underline";
        blink = "yes";
        blink-rate = 600;
        beam-thickness = 1.5;
        underline-thickness = "2px";
      };

      key-bindings = {
        clipboard-copy = "Control+Shift+c XF86Copy";
        clipboard-paste = "Control+Shift+v XF86Paste";
      };

      search-bindings = {
        delete-prev-word = "Mod1+BackSpace Control+BackSpace";
        clipboard-paste = "Control+v Control+Shift+v Control+y XF86Paste";
      };
    };
  };
}
