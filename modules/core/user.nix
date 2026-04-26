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
        extraGroups = ["wheel" "input" "render" "video" "i2c"];
        shell = pkgs.zsh;
        linger = true;
        hashedPasswordFile = config.cops.secrets."user/password_hash".path;
      };
    };
  };
}
