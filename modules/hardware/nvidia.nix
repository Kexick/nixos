{...}: {
  boot.extraModprobeConfig = ''
    options nvidia NVreg_EnableGpuFirmware=0
  '';
  boot.kernelParams = ["pcie_port_pm=off"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      open = false;
      nvidiaSettings = true;
      videoAcceleration = true;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };

  systemd.services = {
    nvidia-suspend = {
      before = ["systemd-suspend-then-hibernate.service"];
      requiredBy = ["systemd-suspend-then-hibernate.service"];
    };
    nvidia-hibernate = {
      before = ["systemd-suspend-then-hibernate.service"];
      requiredBy = ["systemd-suspend-then-hibernate.service"];
    };
    nvidia-resume = {
      after = ["systemd-suspend-then-hibernate.service"];
      requiredBy = ["systemd-suspend-then-hibernate.service"];
    };
  };

  nixpkgs.config.nvidia.acceptLicense = true;
  services.xserver.videoDrivers = ["nvidia"];
}
