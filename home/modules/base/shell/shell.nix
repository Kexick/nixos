{pkgs, ...}: {
  # environment.systemPackages = pkgs.zsh-powerlevel10k;

  home.sessionVariablesExtra = ''
    export CUSTOM_API_KEY="$(cat /run/secrets/env/custom_api_key)"
  '';
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      source ~/.p10k.zsh
      export PATH="$HOME/.openviking/bin:$PATH"
      export PATH="$HOME/bin:$PATH"
      export OPENVIKING_CONFIG_FILE="$HOME/.openviking/ov.conf"
      export OPENVIKING_CLI_CONFIG_FILE="$HOME/.openviking/ovcli.conf"'';

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
      ov-server = "~/.openviking/bin/openviking-server";
      dot = "git --git-dir=$HOME/.dotfiles --work-tree=$HOME";
      gc = "sudo nix-collect-garbage -d";
      ff = "sh ~/.config/fastfetch/ff.sh";
      hfr = "home-manager switch --flake /etc/nixos";
      nfr = "nixos-rebuild switch --sudo --flake /etc/nixos";
      reboot = "pkill chromium -15; sleep 1; reboot";
      gens = "sudo nix-env --list-generations -p /nix/var/nix/profiles/system";
      code = "ccr code --model openai,gpt-5.3-codex";
    };
  };
}
