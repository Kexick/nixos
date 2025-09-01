{ pkgs, ... }:

{

  security.sudo.extraRules = [{
    users = [ "kexick" ];
    commands = [{
      command = "${pkgs.nvidia_oc}/bin/nvidia_oc";
      options = [ "NOPASSWD" ];
    }];
  }];
  services.xserver.deviceSection = ''
    Option "Coolbits" "28"
  '';
  services.xserver.displayManager.session = [
    {
      manage = "window";
      name = "openbox-steam";
      start = ''
        export __GLX_VENDOR_LIBRARY_NAME=nvidia
        export XDG_SESSION_TYPE=x11
        export GDK_BACKEND=x11 
        export STEAM_USE_OZONE=0

        ${pkgs.nvidia_oc}/bin/nvidia_oc set --index 0 --freq-offset 170 --mem-offset 550

        ${pkgs.openbox}/bin/openbox-session &
      ( ${pkgs.steam}/bin/steam -bigpicture; ${pkgs.openbox}/bin/openbox --exit ) &
        waitPID=$!
      '';
    }
  ];

  services.displayManager.defaultSession = "none+openbox-steam";
}
