{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 1.0;
        padding = {
          x = 20;
          y = 20;
        };
      };
      font = {
        size = 16;
      };
    };
  };
}
