{ pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "gruvbox";

      editor = {
        line-number = "relative";
        cursorline = true;
        scrolloff = 10;
        mouse = true;
        middle-click-paste = true;
        bufferline = "multiple"; # Show tabs for open buffers
        color-modes = true;

        indent-guides = {
          render = true;
          character = "▏";
          skip-levels = 1;
        };

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };

      keys.normal = {
        "C-d" = [
          "select_all"
          "keep_primary_selection"
        ];
        "C-c" = "toggle_comments";
        "C-x" = "delete_selection";
        "C-v" = "replace_with_yanked";
        "A-up" = "move_line_up";
        "A-down" = "move_line_down";
        "A-j" = "copy_selection_on_next_line";
        "A-k" = "copy_selection_on_prev_line";

        "C-s" = ":w";
        "C-q" = ":bc";
        "C-A-q" = ":q";
        "C-t" = ":sh";

        "L" = "goto_line_end";
        "H" = "goto_first_nonwhitespace";
        "G" = "goto_file_end";
        "g" = {
          "g" = "goto_file_start";
        };
        "S-tab" = "jump_backward";
        "tab" = "jump_forward";

        "C-j" = [
          "move_line_down"
          "move_line_down"
          "move_line_down"
          "move_line_down"
          "move_line_down"
        ];
        "C-k" = [
          "move_line_up"
          "move_line_up"
          "move_line_up"
          "move_line_up"
          "move_line_up"
        ];
        "f" = "find_next_char";
        "F" = "find_prev_char";
      };

      keys.insert = {
        "C-s" = [
          "normal_mode"
          ":w"
          "insert_mode"
        ];
        "A-x" = "normal_mode";
        "C-v" = "paste_after";
      };
    };

    languages = {
      language =
        let
          standard = {
            auto-format = true;
            indent = {
              tab-width = 2;
              unit = "  ";
            };
          };
        in
        [
          (
            {
              name = "nix";
              formatter = {
                command = lib.getExe pkgs.nixfmt;
              };
            }
            // standard
          )
          (
            {
              name = "go";
              roots = [
                "go.work"
                "go.mod"
              ];
              auto-format = true;
              formatter.command = "gofmt";
              language-servers = [ "gopls" ];
            }
            // standard
          )
          (
            {
              name = "c";
              language-servers = [ "clangd" ];
              formatter.command = "clang-format";
            }
            // standard
          )
          (
            {
              name = "cpp";
              language-servers = [ "clangd" ];
              formatter.command = "clang-format";
            }
            // standard
          )

          (
            {
              name = "rust";
            }
            // standard
          )

          (
            {
              name = "python";
              language-servers = [
                "ruff"
                "pyright"
              ];
              formatter.command = "ruff";
              formatter.args = [
                "format"
                "-"
              ];
            }
            // standard
          )

          (
            {
              name = "javascript";
              language-servers = [ "typescript-language-server" ];
              formatter.command = "prettier";
              formatter.args = [
                "--parser"
                "typescript"
              ];
            }
            // standard
          )
          (
            {
              name = "typescript";
              language-servers = [ "typescript-language-server" ];
              formatter.command = "prettier";
              formatter.args = [
                "--parser"
                "typescript"
              ];
            }
            // standard
          )
          (
            {
              name = "jsx";
              language-servers = [ "typescript-language-server" ];
              formatter.command = "prettier";
              formatter.args = [
                "--parser"
                "typescript"
              ];
            }
            // standard
          )
          (
            {
              name = "tsx";
              language-servers = [ "typescript-language-server" ];
              formatter.command = "prettier";
              formatter.args = [
                "--parser"
                "typescript"
              ];
            }
            // standard
          )

          (
            {
              name = "bash";
              formatter.command = "shfmt";
              formatter.args = [
                "-i"
                "2"
              ];
            }
            // standard
          )
          (
            {
              name = "html";
              formatter.command = "prettier";
              formatter.args = [
                "--parser"
                "html"
              ];
            }
            // standard
          )
          (
            {
              name = "css";
              formatter.command = "prettier";
              formatter.args = [
                "--parser"
                "css"
              ];
            }
            // standard
          )
          (
            {
              name = "json";
              formatter.command = "fixjson";
            }
            // standard
          )
          (
            {
              name = "yaml";
              formatter.command = "prettier";
              formatter.args = [
                "--parser"
                "yaml"
              ];
            }
            // standard
          )
          (
            {
              name = "toml";
              formatter.command = "taplo";
              formatter.args = [
                "fmt"
                "-"
              ];
            }
            // standard
          )
          (
            {
              name = "markdown";
              formatter.command = "prettier";
              formatter.args = [
                "--parser"
                "markdown"
              ];
            }
            // standard
          )
          (
            {
              name = "ini";
              formatter.command = "prettier";
              formatter.args = [
                "--parser"
                "ini"
              ];
            }
            // standard
          )
        ];
    };

  };

}
