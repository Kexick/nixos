{
  programs.clock-rs = {
    enable = true;

    settings = {
      general = {
        color = "white";
        interval = 250;
        blink = false;
        bold = false;
      };

      position = {
        horizontal = "center";
        vertical = "center";
      };

      date = {
        fmt = "%A, %d.%m.%Y";
        use_12h = true;
        utc = false;
        hide_seconds = true;
      };
    };
  };
}
