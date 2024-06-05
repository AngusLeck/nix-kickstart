# Find packages here: 
# https://nix-community.github.io/home-manager/options.xhtml
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    docker
    kubectl
    fzf
    k9s
    aws-vault
    awscli2
    yarn
    gh
    nil
    python39
    direnv
  ];

  home.stateVersion = "23.11";

  programs = {
    zsh = import ../config/zsh/zsh.nix;
    git = import ../config/git.nix;
    direnv = import ../config/direnv.nix;
    starship = import ../config/starship.nix;
    vscode.enable = true;
  };
}
