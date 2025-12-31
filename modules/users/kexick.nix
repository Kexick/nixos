{pkgs, ...}:
{
  users.users.kexick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "render" "videо"];
    shell = pkgs.zsh;
    linger = true;
    packages = with pkgs; [
      ayugram-desktop
      easyeffects
      tree
      neovim
      ranger
      termusic
      media-downloader
    ];
  };
}
