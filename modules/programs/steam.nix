{...}: {
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
        env = {
          __GL_SYNC_TO_VBLANK = "0";
          __GL_MaxFramesAllowed = "1";
          __GL_THREADED_OPTIMIZATIONS = "1";
          __GL_SHADER_DISK_CACHE = "1";
          __GL_SHADER_DISK_CACHE_PATH = "/home/kexick/.cache/nvidia";
          __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        };
        args = [
          "-f"
          "--rt"
          "-W"
          "2560"
          "-H"
          "1440"
          "-e"
          "--force-composition"
          "--mangoapp"
        ];
      };
    };
  };
}
