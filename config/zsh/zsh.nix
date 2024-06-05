{
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  autocd = true;
  completionInit = "autoload -Uz compinit && compinit";
  initExtra = ''
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
