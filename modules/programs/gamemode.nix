{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gamemode
    pkgsi686Linux.gamemode
  ];
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        nv_powermizer_mode = 1; # максимальная производительность
      };
    };
  };
}
