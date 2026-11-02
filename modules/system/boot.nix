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
      "quiet"
      "splash"
      "udev.log_priority=3"
      "boot.shell_on_fail"
      "rd.systemd.show_status=false"
      "systemd.show_status=false"
      "vt.global_cursor_default=0"
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
    ];

    initrd = {
      supportedFilesystems = ["btrfs"];
      kernelModules = [
        "tun"
        "xhci_pci"
        "ehci_pci"
        "uhci_hcd"
        "usb_storage"
        "nvidia"
        "nvidia_modeset"
        "nvidia_uvm"
        "nvidia_drm"
      ];
    };

    tmp = {
      useTmpfs = true;
    };

    plymouth = {
      enable = true;
      theme = "spinner";
      showDelay = 3;
      themePackages = with pkgs; [nixos-bgrt-plymouth];
    };
  };
}
