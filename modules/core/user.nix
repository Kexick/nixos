{pkgs, ...}: {
  users.users.kexick = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "render" "video"];
    shell = pkgs.zsh;
    linger = true;
  };
}
