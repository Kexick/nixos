{
  programs = {
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
        env = {
        WLR_NO_HARDWARE_CURSORS     = "1";
        __GL_GSYNC_ALLOWED          = "0";
        __GL_VRR_ALLOWED            = "0";
        __GL_THREADED_OPTIMIZATIONS = "1";
        __GL_SHADER_DISK_CACHE      = "1";
        __GL_SHADER_DISK_CACHE_PATH = "/home/kexick/.cache/nvidia";
        __GL_YIELD                  = "USLEEP";
        vblank_mode                 = "0";
        };
        args = [
          "-e"
          "-f"
          "-g"
          "--rt"
          "-H 1050"
          "-W 1680"
          "--mangoapp"
          "--disable-vrr"
          "--force-grab-cursor"
          # "--xwayland-count 1"
          "--hide-cursor-delay -1"
        ];
      };
    };
  };
}
