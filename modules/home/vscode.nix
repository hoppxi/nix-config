{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Formatter & Linters
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint
        jnoortheen.nix-ide
        ms-python.python
        rust-lang.rust-analyzer
        ms-vscode.cpptools
        ms-vscode.cmake-tools
        llvm-vs-code-extensions.vscode-clangd
        enkia.tokyo-night
        pkief.material-icon-theme
      ];

      userSettings = {
        # Font
        "editor.fontFamily" = "JetBrainsMono Nerd Font";
        "editor.fontSize" = 14;

        # Theme
        "workbench.colorTheme" = "Tokyo Night";
        "workbench.iconTheme" = "material-icon-theme";

        # Formatter & Sidebar
        "editor.formatOnSave" = true;
        "workbench.sideBar.location" = "right";
        "window.menuBarVisibility" = "compact";

        # Nix LSP settings
        "nix.enableLanguageServer" = true;
        "nix.serverSettings" = {
          "nil" = {
            "diagnostics" = {
              "ignored" = [ "unused_binding" "unused_with" ];
            };
            "formatting" = {
              "command" = ["nixfmt-rfc-style"];
            };
          };
        };

        # Per-language formatter
        "[css]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[cpp]" = {
          "editor.defaultFormatter" = "ms-vscode.cpptools";
        };
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };
      };
    };
  };
}
