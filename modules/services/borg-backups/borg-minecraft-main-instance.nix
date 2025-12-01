{ config, ... }:
{
  services.borgbackup.jobs.minecraftMainInstance =
    config.borgJobs.mkJob {
      name = "home";
      repo = "/mnt/hdd0/.backups/minecraft/instances/1.21.10";
    };
}
