# Find packages here: 
# https://nix-community.github.io/home-manager/options.xhtml
{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim
    docker
    kubectl
    fzf
    k9s
    aws-vault
    awscli2
    yarn
  ];

  home.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;

  programs = {
    /* SHELL */
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true; 
      completionInit = "autoload -Uz compinit && compinit";
      initExtra = ''
      ${builtins.readFile ../config/zsh/alias.zsh};
      ${builtins.readFile ../config/zsh/functions.zsh};
      ${builtins.readFile ../config/zsh/setup.zsh};
      '';
      envExtra = ''
        alias ailo-tools="nix run git+ssh://git@github.com/ailohq/ailo-tools.git --tarball-ttl 68400"
        alias ls="ls --color=auto -a"
        change-profile() { eval "$(ailo-tools shell_change_profile)" ; }
        change-namespace() { eval "$(ailo-tools shell_change_namespace)" ; }
      '';
    };

    git = {
      enable = true;
      aliases = {};
      extraConfig = {
        # https://www.youtube.com/watch?v=aolI_Rz0ZqY
        rerere = {
          enabled = true;
        };
        column.ui = "auto";
        branch.sort = "-committerdate";
        # https://blog.sffc.xyz/post/185195398930/why-you-should-use-git-pull-ff-only
        pull = { 
          ff =  "only";
        };
      };
    };

    direnv = { 
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true; 
    };

    /* PROMPT */
    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    vscode = {
      enable = true;
    }; 
  };
}
