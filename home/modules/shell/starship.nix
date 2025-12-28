{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      format = ''$directory $git_branch $fill $rust$golang$nodejs$dotnet$python$java$c$haskell$ruby$php$lua$elixir$swift$cmd_duration$time$line_break$character'';

      character = {
        success_symbol = "[   ](bold fg:blue)";
        error_symbol = "[   ](bold fg:red)";
      };

      fill = {
        symbol = " ";
        style = "fg:current_line";
      };

      time = {
        disabled = false;
        format = "[ 󰜥 ](fg:current_line)[](fg:white)[󱑎 $time ](fg:white bg:box)[](fg:white)";
        time_format = "%T";
      };

      rust = {
        format = "[ 󰜥 ](fg:current_line)[](fg:red)[$symbol](fg:primary bg:red)[](fg:red bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Rust";
      };

      golang = {
        format = "[ 󰜥 ](fg:current_line)[](fg:cyan)[$symbol](fg:primary bg:cyan)[](fg:cyan bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Go";
      };

      nodejs = {
        format = "[ 󰜥 ](fg:current_line)[](fg:green)[$symbol](fg:primary bg:green)[](fg:green bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = "󰎙 Node.js";
      };

      dotnet = {
        format = "[ 󰜥 ](fg:current_line)[](fg:purple)[$symbol](fg:primary bg:purple)[](fg:purple bg:box)[ $tfm](fg:foreground bg:box)[](fg:box)";
        symbol = " .NET";
      };

      python = {
        format = "[ 󰜥 ](fg:current_line)[](fg:green)[$symbol](fg:primary bg:green)[](fg:green bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Python";
      };

      java = {
        format = "[ 󰜥 ](fg:current_line)[](fg:red)[$symbol](fg:primary bg:red)[](fg:red bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Java";
      };

      c = {
        format = "[ 󰜥 ](fg:current_line)[](fg:blue)[$symbol](fg:primary bg:blue)[](fg:blue bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " C";
      };

      haskell = {
        format = "[ 󰜥 ](fg:current_line)[](fg:purple)[$symbol](fg:primary bg:purple)[](fg:purple bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Haskell";
      };

      ruby = {
        format = "[ 󰜥 ](fg:current_line)[](fg:red)[$symbol](fg:primary bg:red)[](fg:red bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Ruby";
      };

      php = {
        format = "[ 󰜥 ](fg:current_line)[](fg:blue)[$symbol](fg:primary bg:blue)[](fg:blue bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " PHP";
      };

      lua = {
        format = "[ 󰜥 ](fg:current_line)[](fg:cyan)[$symbol](fg:primary bg:cyan)[](fg:cyan bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Lua";
      };

      elixir = {
        format = "[ 󰜥 ](fg:current_line)[](fg:purple)[$symbol](fg:primary bg:purple)[](fg:purple bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Elixir";
      };

      swift = {
        format = "[ 󰜥 ](fg:current_line)[](fg:orange)[$symbol](fg:primary bg:orange)[](fg:orange bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Swift";
      };

      git_branch = {
        style = "bg: cyan";
        symbol = "󰘬";
        truncation_length = 12;
        truncation_symbol = "";
        format = "󰜥 [](bold fg:cyan)[$symbol $branch(:$remote_branch)](fg:black bg:cyan)[ ](bold fg:cyan)";
      };

      git_commit = {
        commit_hash_length = 4;
        tag_symbol = " ";
      };

      git_state = {
        format = ''[\($state( $progress_current of $progress_total)\)]($style) '';
        cherry_pick = "[ PICKING](bold red)";
      };

      git_status = {
        conflicted = "  ";
        ahead = "  ";
        behind = " ﰸ ";
        diverged = " ✧ ";
        untracked = "  ";
        stashed = "  ";
        modified = "  ";
        staged = ''[++\($count\)](green)]'';
        deleted = "  ";
      };

      hostname = {
        ssh_only = false;
        format = "[•$hostname](bg:cyan bold fg:black)[](bold fg:cyan)";
        trim_at = ".companyname.com";
        disabled = false;
      };

      line_break = {
        disabled = false;
      };

      memory_usage = {
        disabled = true;
        threshold = -1;
        symbol = " ";
        style = "bold dimmed green";
      };

      username = {
        style_user = "bold bg:cyan fg:black";
        style_root = "red bold";
        format = "[](bold fg:cyan)[$user]($style)";
        disabled = false;
        show_always = true;
      };

      directory = {
        home_symbol = "  ";
        read_only = "  ";
        style = "bg:green fg:black";
        truncation_length = 6;
        truncation_symbol = " ••/";
        format = ''[](bold fg:green)[󰉋 $path]($style)[](bold fg:green)'';

        substitutions = {
          "Desktop" = "  ";
          "Documents" = "  ";
          "Downloads" = "  ";
          "Music" = " 󰎈 ";
          "Pictures" = "  ";
          "Videos" = "  ";
          "GitHub" = " 󰊤 ";
        };
      };

      cmd_duration = {
        min_time = 0;
        format = ''[](bold fg:yellow)[󰪢 $duration](bold bg:yellow fg:black)[](bold fg:yellow)'';
      };
    };
  };
}
