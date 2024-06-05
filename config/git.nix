{
  enable = true;
  aliases = { };
  userEmail = "aleck42@gmail.com";
  userName = "angus leck";
  extraConfig = {
    rerere = {
      enabled = true;
    };
    column.ui = "auto";
    branch.sort = "-committerdate";
    pull = {
      ff = "only";
    };
  };
}
