{
  config,
  lib,
  pkgs,
  ...
}: let
  nvidia_x11 = config.hardware.nvidia.package;
in {
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

  environment.etc."systemd/system-sleep/nvidia" = {
    source = pkgs.writeShellScript "nvidia-system-sleep" ''
      export PATH="${lib.makeBinPath [pkgs.coreutils pkgs.kbd]}:$PATH"
      exec "${nvidia_x11.out}/lib/systemd/system-sleep/nvidia" "$@"
    '';
  };

  systemd.services = {
    nvidia-suspend = {
      before = ["systemd-suspend-then-hibernate.service"];
      wantedBy = ["systemd-suspend-then-hibernate.service"];
    };

    nvidia-resume = {
      after = ["systemd-suspend-then-hibernate.service"];
      wantedBy = ["systemd-suspend-then-hibernate.service"];
    };
  };

  nixpkgs.config.nvidia.acceptLicense = true;
  services.xserver.videoDrivers = ["nvidia"];
}
