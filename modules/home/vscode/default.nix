{ pkgs, ... }:

let

  ewwYuckExt = {
    name = "yuck";
    publisher = "eww-yuck";
    version = "0.0.3";
    sha256 = "1hxdxa13s1vlilw7fidr8vnl19c9wjazjvnvmqgl4fsswwny110c";
  };

  qtQMLExt = {
    name = "qt-qml";
    publisher = "theqtcompany";
    version = "1.6.0";
    sha256 = "151cm56h4rz4z264jy7pavz56rw15kb6n8nblma3jn6pfmhflbyh";
  };

  qtCoreExt = {
    name = "qt-core";
    publisher = "theqtcompany";
    version = "1.6.0";
    sha256 = "0dzbc4jn34j1rcsa5zi0snm3by77xpwhz46ygb4z1fz93srrqbcs";
  };

in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions =
        with pkgs.vscode-extensions;
        [
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
          ritwickdey.liveserver
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          ewwYuckExt
          qtQMLExt
          qtCoreExt
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
        "liveServer.settings.donotShowInfoMsg" = true;
        "liveServer.settings.donotVerifyTags" = true;
        "liveServer.settings.ignoreFiles" = [
          "./imports/**"
        ];

        # Nix LSP settings
        "nix.enableLanguageServer" = true;
        "nix.serverSettings" = {
          "nil" = {
            "diagnostics" = {
              "ignored" = [
                "unused_binding"
                "unused_with"
              ];
            };
            "formatting" = {
              "command" = [ "nixfmt" ];
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
