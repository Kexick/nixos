{
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      # SDL_VIDEODRIVER = "wayland";
      # MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
