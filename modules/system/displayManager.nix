{
  services.xserver.displayManager.startx.enable = true;
  services = {
    displayManager = {
      ly.enable        = false;

      autoLogin = { 
        enable = false;
        user   = "kexick";
      };

      sddm = {
        enable = true;
        theme = "/usr/share/sddm/themes/sugarcandy/";
      };
    };
  };
}
