{
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  autocd = true;
  completionInit = "autoload -Uz compinit && compinit";
  history = {
    size = 10000;
    save = 10000;
    path = "$HOME/.zsh_history";
  };
  initExtra = ''
    # History options
    mkdir -p "$(dirname "$HOME/.zsh_history")"
    setopt HIST_FCNTL_LOCK
    setopt HIST_IGNORE_DUPS
    unsetopt HIST_IGNORE_ALL_DUPS
    setopt HIST_IGNORE_SPACE
    unsetopt HIST_EXPIRE_DUPS_FIRST
    setopt SHARE_HISTORY
    unsetopt EXTENDED_HISTORY

    ${builtins.readFile ./setup.zsh}
    ${builtins.readFile ./functions.zsh}
    ${builtins.readFile ./alias.zsh}
  '';
  envExtra = ''
    alias ailo-tools="nix run git+ssh://git@github.com/ailohq/ailo-tools.git --tarball-ttl 68400"
    alias ls="ls --color=auto -a"
    change-profile() { eval "$(ailo-tools shell_change_profile)" ; }
    change-namespace() { eval "$(ailo-tools shell_change_namespace)" ; }
  '';
}
