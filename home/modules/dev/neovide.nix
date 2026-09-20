{pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
  ];
  programs = {
    neovide = {
      enable = true;
      settings = {
        tabs = true;
        font = {
          size = 14.0;
          normal.family = "JetBrainsMonoNL Nerd Font Mono";
        };
        box-drawing.mode = "native";
      };
    };
  };
}
