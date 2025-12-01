{ config, ... }:
{
  services.borgbackup.jobs.home =
    config.borgJobs.mkJob {
      name = "home";
      repo = "/mnt/hdd0/.backups/home";
    };
}
