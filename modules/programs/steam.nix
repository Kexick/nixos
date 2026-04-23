{...}: {
  programs = {
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
          "-e"
          "-f"
          "--rt"
          "-H"
          "2560"
          "-W"
          "1440"
          "--mangoapp"
          "--force-composition"
          "--backend"
          "sdl"
        ];
      };
    };
  };
}
