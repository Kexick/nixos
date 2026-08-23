{
  nix.settings = {
    cores = 0;
    max-jobs = 4;
    http-connections = 50;
    max-substitution-jobs = 20;
    connect-timeout = 5;
    stalled-download-timeout = 10;

    trusted-users = ["root"];

    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
