{pkgs, ...}: {
  users.users.kexick = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "render" "video" "i2c"];
    shell = pkgs.zsh;
    linger = true;
  };
}
