{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      scan_timeout = 10;
      command_timeout = 500;

      format = ''
        $username$hostname$directory$git_branch$git_status$nodejs$rust$golang$python$docker_context$kubernetes$battery$memory_usage$cmd_duration$line_break$jobs$character
      '';

      username = {
        format = "[$user]($style)";
        style_user = "bold green";
        style_root = "bold red";
        disabled = false;
        show_always = true;
      };

      hostname = {
        format = "[@$hostname]($style) ";
        style = "bold blue";
        ssh_only = false;
      };

      directory = {
        format = "[ $path]($style) ";
        style = "bold cyan";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = " ";
        style = "bold purple";
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "bold red";
      };

      nodejs = {
        format = "[ $version]($style) ";
        style = "green";
      };

      rust = {
        format = "[ $version]($style) ";
        style = "red";
      };

      golang = {
        format = "[ $version]($style) ";
        style = "cyan";
      };

      python = {
        format = "[ $version]($style) ";
        style = "yellow";
      };

      docker_context = {
        format = "[ $context]($style) ";
        style = "blue";
      };

      kubernetes = {
        format = "[☸ $context]($style) ";
        style = "bold magenta";
        disabled = false;
      };

      memory_usage = {
        format = "[RAM: $used/$total]($style) ";
        style = "bold bright-cyan";
        disabled = false;
      };

      cmd_duration = {
        format = "[⏱ $duration]($style) ";
        min_time = 5000; # ms
        style = "bold yellow";
      };

      jobs = {
        format = "[✦ $number]($style) ";
        style = "bold red";
      };

      character = {
        success_symbol = "[](bold green) ";
        error_symbol = "[](bold red) ";
        vicmd_symbol = "[](bold yellow) ";
      };
    };
  };
}
