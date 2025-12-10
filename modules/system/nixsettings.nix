{
  nix.settings = { 
    cores                 = 0;
    max-jobs              = 4;
    http-connections      = 50;
    max-substitution-jobs = 20;

    trusted-users = [ "root" "kexick" ];

    extra-substituters = [
        "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
