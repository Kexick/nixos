{config, ...}: {
  services.borgbackup.jobs.secrets-remote = config.borgJobs.mkJob {
    name = "secrets-remote";
    repo = "ssh://jdh29855@jdh29855.repo.borgbase.com/./repo";
    schedule = "daily";
    localRepo = false;
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat ${config.sops.secrets."borg/passphrase".path}";
    };
    prune = {
      daily = 7;
      weekly = 4;
      monthly = 6;
    };
  };
}
