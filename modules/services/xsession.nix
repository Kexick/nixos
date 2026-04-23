{pkgs, ...}: {
  # services.xserver.deviceSection = ''
  #   Option "Coolbits" "28"
  # '';
  services.xserver.displayManager.session = [
    {
      manage = "window";
      name = "openbox";
      start = ''
        export __GLX_VENDOR_LIBRARY_NAME=nvidia
        export XDG_SESSION_TYPE=x11
        export GDK_BACKEND=x11
        export STEAM_USE_OZONE=0

        export __GL_SYNC_TO_VBLANK=0
        export __GL_MaxFramesAllowed=1

        export __NV_PRIME_RENDER_OFFLOAD=0
        export PROTON_USE_WINED3D=0
        export DXVK_ASYNC=1

        export PROTON_NO_ESYNC=0
        export PROTON_NO_FSYNC=0
        ${pkgs.openbox}/bin/openbox-session
      '';
    }
  ];

  services.displayManager.defaultSession = "none+openbox";
}
