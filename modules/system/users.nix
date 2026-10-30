{
  pkgs,
  config,
  ...
}: {
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPasswordFile = config.sops.secrets."user/password_hash".path;
      };
      kexick = {
        isNormalUser = true;
        extraGroups = ["wheel" "input" "render" "video" "i2c" "gamemode"];
        shell = pkgs.zsh;
        linger = true;
        hashedPasswordFile = config.sops.secrets."user/password_hash".path;
      };
    };
  };
}
