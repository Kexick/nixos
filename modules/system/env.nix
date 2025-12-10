{
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    sessionVariables = {
        NIXOS_OZONE_WL = "1";
        WLR_NO_HARDWARE_CURSORS = "1";
        VK_LAYER_WSI_WAYLAND_NO_DMABUF = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
# SDL_VIDEODRIVER = "wayland";
# MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
