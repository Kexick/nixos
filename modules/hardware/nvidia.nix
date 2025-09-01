{ pkgs, ...}:
{
  environment.systemPackages = [ pkgs.nvidia_oc ];
  hardware = {
    graphics = {
      enable      = true;
      enable32Bit = true;
    };
    nvidia = {
      open                   = false;
      nvidiaSettings         = true;
      videoAcceleration      = true;
      modesetting.enable     = true;
      powerManagement.enable = true;
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
