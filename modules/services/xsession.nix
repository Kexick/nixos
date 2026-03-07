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

        ${pkgs.openbox}/bin/openbox-session
      '';
    }
  ];

  services.displayManager.defaultSession = "none+openbox";
}
