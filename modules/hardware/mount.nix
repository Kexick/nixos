{
  fileSystems = {
    "/mnt/hdd0" = {
      device = "/dev/disk/by-uuid/ee10421e-66bd-44d3-852b-7d38a6a5911a";
      fsType = "ext4";
      options = [
        "noatime"
        "nofail"
        "noauto"
        "x-systemd.automount"
        "x-systemd.device-timeout=1s"
      ];
    };
    "/mnt/ssd0" = {
      device = "/dev/disk/by-uuid/fd0de497-1744-4724-8e6e-a7ee7fe63320";
      fsType = "ext4";
      options = [
        "commit=60"
        "noatime"
        "nofail"
        "noauto"
        "x-systemd.automount"
        "x-systemd.device-timeout=1s"
      ];
    };
    # "/mnt/hdd1" = {
    # 	device = "/dev/disk/by-uuid/B038304438300C3A";
    # 	fsType = "ntfs3";
    # 	options = [ "uid=1000" "gid=100" "umask=022" "noatime" ];
    # 	};
  };
}
