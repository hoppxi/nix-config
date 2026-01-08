let
  colors = import ../theme/colors.nix;
in
{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      format = ''$directory $git_branch $fill $c$rust$golang$nodejs$python$lua$cmd_duration$time$line_break$character'';
      palette = "gruvbox_custom";
      palettes.gruvbox_custom = {
        primary = colors.primary;
        secondary = colors.secondary;
        tertiary = colors.tertiary;
        background = colors.background;

        box = colors.surface;
        icon_box = colors.surface-variant;
        foreground = colors.on-surface;

        red = colors.error;
        green = colors.secondary;
        blue = colors.primary;
        purple = colors.tertiary;

        cyan = "#8ec07c";
        yellow = "#d79921";
        orange = "#d65d0e";

        start_icon = colors.surface-container-highest;
      };

      character = {
        success_symbol = "[   ](bold blue)";
        error_symbol = "[   ](bold red)";
      };

      fill = {
        symbol = " ";
        style = "fg:box";
      };

      time = {
        disabled = false;
        format = "[ 󰜥 ](fg:start_icon)[](fg:yellow)[󱑎](fg:background bg:yellow)[](fg:yellow bg:box)[ $time ](fg:foreground bg:box)[](fg:box)";
        time_format = "%T";
      };

      c = {
        format = "[ 󰜥 ](fg:start_icon)[](fg:blue)[$symbol](fg:background bg:blue)[](fg:blue bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " C/C++";
        detect_extensions = [
          "c"
          "cpp"
          "h"
          "hpp"
          "cc"
          "cxx"
        ];
        detect_files = [
          "CMakeLists.txt"
          "Makefile"
        ];
      };

      rust = {
        format = "[ 󰜥 ](fg:start_icon)[](fg:red)[$symbol](fg:background bg:red)[](fg:red bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Rust";
      };

      golang = {
        format = "[ 󰜥 ](fg:start_icon)[](fg:cyan)[$symbol](fg:background bg:cyan)[](fg:cyan bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Go";
      };

      nodejs = {
        format = "[ 󰜥 ](fg:start_icon)[](fg:green)[$symbol](fg:background bg:green)[](fg:green bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = "󰎙 Node.js";
      };

      python = {
        format = "[ 󰜥 ](fg:start_icon)[](fg:green)[$symbol](fg:background bg:green)[](fg:green bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Python";
      };

      lua = {
        format = "[ 󰜥 ](fg:start_icon)[](fg:cyan)[$symbol](fg:background bg:cyan)[](fg:cyan bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
        symbol = " Lua";
      };

      git_branch = {
        style = "bg:cyan";
        symbol = "󰘬";
        truncation_length = 12;
        truncation_symbol = "";
        format = "󰜥 [](bold cyan)[$symbol $branch(:$remote_branch)](background bg:cyan)[ ](bold cyan)";
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
        format = "[•$hostname](bg:cyan bold background)[](bold cyan)";
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
        style_user = "bold bg:cyan background";
        style_root = "red bold";
        format = "[](bold cyan)[$user]($style)";
        disabled = false;
        show_always = true;
      };

      directory = {
        home_symbol = "  ";
        read_only = "  ";
        style = "bg:green background";
        truncation_length = 6;
        truncation_symbol = " ••/";
        format = ''[](bold green)[ $path]($style)[](bold green)'';

        substitutions = {
          "Documents" = "  ";
          "Downloads" = "  ";
          "Pictures" = "  ";
          "devspace" = " 󰊤 ";
          "nix-config" = "  ";
        };
      };

      cmd_duration = {
        min_time = 0;
        format = ''[](bold yellow)[󰪢 $duration](bold bg:yellow background)[](bold yellow)'';
      };
    };
  };
}
