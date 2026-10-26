{
  enable = true;
  enableZshIntegration = true;
  nix-direnv.enable = true;
  config = {
    global = {
      strict_env = false;
    };
  };
}
