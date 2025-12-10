{ pkgs, ... }:

{
  # environment.systemPackages = pkgs.zsh-powerlevel10k;
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''source ~/.p10k.zsh'';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
        "fancy-ctrl-z"
      ];
    };
    shellAliases = {
      fm          = "sudo -E ranger";
      # ss          = "systemctl suspend";
      gc          = "sudo nix-collect-garbage -d";
      ff          = "sh ~/.config/fastfetch/ff.sh";
      nrebs       = "sudo nixos-rebuild switch";
      hfr         = "home-manager switch --flake /etc/nixos";
      reboot      = "pkill chromium -15; sleep 1; reboot";
      nconf       = "sudo nvim /etc/nixos/configuration.nix";
      pkglist     = "sudo nvim /etc/nixos/modules/packages.nix";
      nfr         = "nixos-rebuild switch --sudo --flake /etc/nixos";
      generations = "sudo nix-env --list-generations -p /nix/var/nix/profiles/system";
    };
  };
}
