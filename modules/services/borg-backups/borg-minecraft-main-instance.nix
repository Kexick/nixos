{ config, ... }:

{
    services.borgbackup.jobs.minecraftMainInstance =
        config.borgJobs.mkJob {
         name = "minecraft-main-instance";
         repo = "/mnt/hdd0/.backups/minecraft/instances/1.21.10";
     };
}

