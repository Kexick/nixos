{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    timeout = 10;
    grub = {
      enable = true;
      device = "nodev";
      gfxmodeEfi = "auto";
      efiSupport = true;
      useOSProber = true;
      minegrub-world-sel = {
        enable = true;

        customIcons = with config.system; [
          {
            inherit name;

            lineTop = with nixos;
              distroName + " " + codeName + " (" + version + ")";

            lineBottom =
              "Survival Mode, No Cheats, Version: " + nixos.release;

            imgName = "nixos";
          }
        ];
      };
    };
  };

  boot = {
    kernelParams = [
      # "quiet"
      # "splash"
      "udev.log_priority=3"
      "boot.shell_on_fail"
      "rd.systemd.show_status=auto"
    ];
    resumeDevice = "/dev/disk/by-uuid/daf789e9-bb49-4205-8c50-0c124637c8c6";

    initrd = {
      supportedFilesystems = ["btrfs"];
      systemd.enable = true;
      kernelModules = [
        "tun"
        "xhci_pci"
        "ehci_pci"
        "uhci_hcd"
        "usb_storage"
      ];
    };

    tmp = {
      useTmpfs = true;
    };

    plymouth = {
      enable = false;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [nixos-bgrt-plymouth];
    };
  };
}
