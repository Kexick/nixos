{ pkgs, ... }:
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
        theme = "story-dark";
        settings.Theme.ThemeDir = "/usr/share/sddm/themes";
        extraPackages = [
            pkgs.kdePackages.qt5compat
        ];
      };
    };
  };
}
