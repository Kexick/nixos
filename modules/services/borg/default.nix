{...}: {
  imports = [
    ./borg-home.nix
    ./borg-services.nix
    ./borg-minecraft-main-instance.nix
    ./borg-secrets-remote.nix
    ./borg-check.nix
  ];
}
