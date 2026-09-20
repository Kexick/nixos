{pkgs, ... }:{
  programs.discord = {
    enable = true;
    package = pkgs.discord;
    settings.SKIP_HOST_UPDATE = true;
  };
}
