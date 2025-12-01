
{ config, pkgs, ... }:

{
  services.borgbackup.jobs.home = {
      patternsFrom = {
          "/mnt/hdd0/.backups/config/global.txt"
          "/mnt/hdd0/.backups/config/home.txt"
      };
    repo = "/mnt/hdd0/.backups/home";
    encryption = {
      mode = "none";
    };
    compression = "auto,zstd";
    prune.keep = {
      weekly = 3;
    };
    startAt = "weekly";
    user = "kexick";
    group = "users";
  };
}


