{
  fileSystems = {
    "/mnt/hdd0" = {
      device = "/dev/disk/by-uuid/ee10421e-66bd-44d3-852b-7d38a6a5911a";
      fsType = "ext4";
      options = [ "noatime" "nofail" "noauto" "x-systemd.automount" "x-systemd.device-timeout=1s" ];
    };
    "/mnt/ssd0" = {
      device = "/dev/disk/by-uuid/fd0de497-1744-4724-8e6e-a7ee7fe63320";
      fsType = "ext4";
      options = [ "commit=60" "noatime" "nofail" "noauto" "x-systemd.automount" "x-systemd.device-timeout=1s"];
    };
    # "/boot" = {
    # device = "/dev/disk/by-uuid/A8BD-3FF6";
    # fsType = "vfat";
    # options = [ "defaults" ];
    # };
    "/" = {
        device = "/dev/disk/by-uuid/f3bc4a81-97e1-4615-90a5-441ca5b15bba";
        fsType = "btrfs";
        options = ["subvol=@" "noatime" "compress=zstd:3" "discard=async" ];
    };

    "/home" = {
        device = "/dev/disk/by-uuid/f3bc4a81-97e1-4615-90a5-441ca5b15bba";
        fsType = "btrfs";
        options = ["subvol=@home" "noatime" "compress=zstd:3" "discard=async"];
      };

    "/nix" = {
        device = "/dev/disk/by-uuid/f3bc4a81-97e1-4615-90a5-441ca5b15bba";
        fsType = "btrfs";
        options = ["subvol=@nix" "noatime" "compress=zstd:5" "discard=async"];
      };

    "/var/log" = {
        device = "/dev/disk/by-uuid/f3bc4a81-97e1-4615-90a5-441ca5b15bba";
        fsType = "btrfs";
        options = ["subvol=@log" "noatime" "compress=zstd:6" "discard=async"];
      };

    "/games" = {
        device = "/dev/disk/by-uuid/f3bc4a81-97e1-4615-90a5-441ca5b15bba";
        fsType = "btrfs";
        options = ["subvol=@games" "noatime" "compress=no" "discard=async"];
      };

    "/games/prefix" = {
        device = "/dev/disk/by-uuid/f3bc4a81-97e1-4615-90a5-441ca5b15bba";
        fsType = "btrfs";
        options = ["subvol=@games/prefix" "noatime" "autodefrag" "compress=zstd:3" "discard=async"];
      };

    "/swap" = {
        device = "/dev/disk/by-uuid/f3bc4a81-97e1-4615-90a5-441ca5b15bba";
        fsType = "btrfs";
        options = ["subvol=@swap" "noatime" "compress=no"];
      };

  };
  swapDevices = [{
      device = "/swap/swapfile";
      size = 32768; 
  }];

# "/mnt/hdd1" = {
# 	device = "/dev/disk/by-uuid/B038304438300C3A";
# 	fsType = "ntfs3";
# 	options = [ "uid=1000" "gid=100" "umask=022" "noatime" ];
# 	};
}
