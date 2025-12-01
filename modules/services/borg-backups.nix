
{ config, pkgs, ... }:

let
  repoPath = "/mnt/hdd/.backups/home";
in {
  services.borgbackup.jobs.home = {
    enable = true;
    paths = [ "/home" ];
    exclude = [ "/home/kexick/Downloads" ];
    repo = repoPath;
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


