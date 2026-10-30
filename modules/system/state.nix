{pkgs, ...}: {
  # Set your time zone.
  time.timeZone = "Asia/Omsk";

  i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v24n.psf.gz";
    keyMap = "ruwin_cplk-UTF-8";
    packages = [pkgs.terminus_font];
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
