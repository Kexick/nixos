{pkgs, ...}: {
  users.users.kexick = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "render" "videо"];
    shell = pkgs.zsh;
    linger = true;
  };
}
