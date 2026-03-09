{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    keyMode = "vi";

    prefix = "C-Space";

    baseIndex = 1;

    mouse = true;

    escapeTime = 0;

    historyLimit = 10000;

    terminal = "tmux-256color";

    extraConfig = ''

      # Split window Alt + h/v
      bind -n M-v split-window -h -c "#{pane_current_path}"
      bind -n M-h split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # select pane Prefix + h/j/k/l
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      # Resize refix + H/J/K/L
      bind H resize-pane -L 5
      bind J resize-pane -D 5
      bind K resize-pane -U 5
      bind L resize-pane -R 5

      # Select window Alt + [1..9]
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9


      bind Tab new-window
      bind c kill-pane


      # Reload config Prefix + r
      bind r source-file ~/.config/tmux/tmux.conf \; display "reloaded"

      # Status bar
      set -g status-position bottom
      set -g status-style bg=colour234,fg=colour137
      set -g status-left '#[fg=#1e1e2e,bg=colour241]  #S #[fg=colour241,bg=colour234] '
      set -g status-right '#[fg=colour241,bg=colour234]#[fg=colour233,bg=colour241]  %H:%M '
      set -g window-status-current-format "#[fg=#77dd77]#[fg=#1e1e2e,bg=#77dd77] #I #W #[fg=#77dd77,bg=default]"
      set -g window-status-format "#[fg=#a3b7a0]#[fg=#1e1e2e,bg=#a3b7a0] #I #W #[fg=#a3b7a0,bg=default]"
      set -g window-status-separator " "

      set -g pane-border-lines simple

    '';

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      continuum
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '4'
        '';
      }
    ];
  };
}
