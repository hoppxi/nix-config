{ pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "gruvbox";

      editor = {
        line-number = "relative";
        mouse = true;
        auto-save = true;
        auto-format = true;
        idle-timeout = 50;
        completion-trigger-len = 2;
        cursorline = true;
        color-modes = true;

        bufferline = "multiple";
        indent-guides.render = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };

      keys.normal = {
        "space" = {
          "f" = "file_picker";
          "F" = "file_picker_in_current_directory";
          "b" = "buffer_picker";
          "s" = "symbol_picker";
          "S" = "workspace_symbol_picker";
          "r" = "rename_symbol";
          "a" = "code_action";
          "?" = "command_palette";
        };

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
                command = lib.getExe pkgs.nixfmt-rfc-style;
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
          ({ name = "bash"; } // standard)
          ({ name = "c"; } // standard)
          ({ name = "cpp"; } // standard)
          ({ name = "rust"; } // standard)
          ({ name = "python"; } // standard)
          ({ name = "javascript"; } // standard)
          ({ name = "typescript"; } // standard)
          ({ name = "jsx"; } // standard)
          ({ name = "tsx"; } // standard)
          ({ name = "html"; } // standard)
          ({ name = "css"; } // standard)
          ({ name = "json"; } // standard)
          ({ name = "yaml"; } // standard)
          ({ name = "toml"; } // standard)
          ({ name = "markdown"; } // standard)
        ];
    };

  };

}
