{config, ...}: let
  name = "home";
in {
  services.borgbackup.jobs.home = config.borgJobs.mkJob {
    name = "nixos-${name}";
    repo = "/mnt/hdd0/.backups/home";
  };
}
