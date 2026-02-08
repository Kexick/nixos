{
  pkgs,
  inputs,
  config,
  ...
}: let
  Theme = pkgs.fetchFromGitHub {
    owner = "Lxtharia";
    repo = "minegrub-theme";
    rev = "main";
    sha256 = "sha256-GvlAAIpM/iZtl/EtI+LTzEsQ2qlUkex9i4xRUZXmadM=";
  };
in {
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

            # Use an icon from the remote repo
            imgName = "nixos";

            # Or load from a local file
            # customImg = builtins.path {
            #   path = ./nixos-logo.png;
            #   name = "nixos-img";
            # };
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
    ];

    initrd.kernelModules = [
      "tun"
      "xhci_pci"
      "ehci_pci"
      "uhci_hcd"
      "usb_storage"
    ];

    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [nixos-bgrt-plymouth];
    };
  };
}
