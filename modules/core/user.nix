{
  pkgs,
  config,
  ...
}: {
  users = {
    mutableUsers = true;
    users = {
      root = {
      };
      kexick = {
        isNormalUser = true;
        extraGroups = ["wheel" "input" "render" "video" "i2c"];
        shell = pkgs.zsh;
        linger = true;
      };
    };
  };
}
