{ pkgs, ... }:
let
  lainTheme = pkgs.fetchFromGitHub {
    owner  = "uiriansan";
    repo   = "LainGrubTheme";
    rev    = "main";
    sha256 = "sha256-gDwNolJ28UQUjE2G2U0bvzh29E9EEiet9SlItbY46IQ";
  };
in
{
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      timeout = 1;
      grub = {
          enable      = true;
          device      = "nodev";
          gfxmodeEfi  = "1680x1050";
          efiSupport  = true;
          useOSProber = true;
          theme       = "${lainTheme}/lain";
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
    supportedFilesystems = [ "ntfs3" ];
    initrd.kernelModules = [
      "tun"
      "xhci_pci"
      "ehci_pci"
      "uhci_hcd"
      "usb_storage"
    ];
    plymouth = {
      enable        = true;
      theme         = "nixos-bgrt";
      themePackages = with pkgs; [ nixos-bgrt-plymouth ];
    };
  };
}
