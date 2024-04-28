
{ pkgs, config, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    mouse = true;
    prefix = "C-Space";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      prefix-highlight
      catppuccin
      ctrlw
      continuum
      resurrect
      sidebar
      yank
      {
        plugin = fingers;
        extraConfig = "
        set -g @fingers-show-copied-notification '1'
        set -g @fingers-pattern-0 '[^ \n\t]*(([^A-Za-z \n\t]+[^ \n\t]+)|([^ \n\t]+[A-Z]+))[^ \n\t]*'
        ";
      }
    ];
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection

      unbind -T copy-mode-vi MouseDragEnd1Pane

      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
    '';
  };
}
