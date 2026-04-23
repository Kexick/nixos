{
  pkgs,
  inputs,
  config,
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
      gfxmodeEfi = "2560x1440";
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
      "rd.systemd.show_status=auto"
      "resume_offset=86076043"
    ];

    resumeDevice = config.fileSystems."/swap".device;

    initrd.kernelModules = [
      "tun"
      "xhci_pci"
      "ehci_pci"
      "uhci_hcd"
      "usb_storage"
    ];

    tmp = {
      useTmpfs = true;
    };

    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [nixos-bgrt-plymouth];
    };
  };
}
