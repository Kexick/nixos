{
  pkgs,
  config,
  lib,
  ...
}: {
  # environment.systemPackages = [pkgs.nvidia_oc];
  boot.kernelParams = ["nvidia.NVreg_EnableGpuFirmware=0" "pcie_port_pm=off"];
  boot.extraModprobeConfig = ''
    options nvidia NVreg_PreserveVideoMemoryAllocations=1
  '';
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver
        libvdpau-va-gl
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      open = false;
      nvidiaSettings = true;
      videoAcceleration = true;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };

  nixpkgs.config.nvidia.acceptLicense = true;
  services.xserver.videoDrivers = ["nvidia"];
}
