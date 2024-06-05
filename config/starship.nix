{
  enable = true;
  enableZshIntegration = true;
  settings = {
    # "$schema" = "https://starship.rs/config-schema.json";

    format = "$directory$git_status$git_state$battery$git_branch";

    add_newline = false;

    character = {
      disabled = true;
      format = "$symbol";
      success_symbol = "[❯](dimmed blue)";
      error_symbol = "[✖](bold red)";
      vimcmd_symbol = "[❮](dimmed blue)";
    };

    package = {
      disabled = true;
    };

    git_branch = {
      format = "[$symbol$branch]($style): ";
      symbol = "";
      style = "bold green";
    };

    git_commit = {
      commit_hash_length = 8;
      style = "bold white";
    };

    git_state = {
      style = "bold red";
      format = "[\($state( $progress_current of $progress_total)\)]($style) ";
    };

    git_status = {
      conflicted = "⚔️ ";
      ahead = "$\{count\}a ";
      behind = "$\{count\}b ";
      diverged = "diverged: $\{ahead_count\}a $\{behind_count\}b ";
      untracked = "[$\{count\}ut ](bold grey)";
      stashed = "$count📂 ";
      staged = "[$\{count\}s ](bold blue)";
      modified = "[$\{count\}m ](bold yellow)";
      renamed = "[$\{count\}r ](bold yellow)";
      deleted = "[$\{count\}d ](bold red)";
      format = "$all_status$ahead_behind ";
    };

    battery = {
      full_symbol = "";
      charging_symbol = "⚡️";
      discharging_symbol = "💀";
    };
  };
}
