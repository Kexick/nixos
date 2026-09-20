{
  nix.settings = {
    cores = 0;
    max-jobs = 4;
    http-connections = 50;
    max-substitution-jobs = 20;
    connect-timeout = 2;
    stalled-download-timeout = 5;
    download-attempts = 3;

    trusted-users = ["root"];

    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
