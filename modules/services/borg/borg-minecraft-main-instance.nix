{config, ...}: let
  name = "minecraft-main-instance";
in {
  services.borgbackup.jobs.minecraftMainInstance = config.borgJobs.mkJob {
    name = "nixos-${name}";
    repo = "/mnt/hdd0/.backups/minecraft/instances/1.21.10";
  };
}
