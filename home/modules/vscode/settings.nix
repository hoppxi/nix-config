{
  programs.vscode.profiles.default.userSettings = {
    "editor.fontFamily" = "Fira Code";
    "editor.fontSize" = 14;
    "editor.lineHeight" = 22;
    "editor.smoothScrolling" = true;

    "workbench.colorTheme" = "Tokyo Night";
    "workbench.iconTheme" = "material-icon-theme";
    "workbench.productIconTheme" = "fluent-icons";

    "workbench.sideBar.location" = "right";
    "workbench.startupEditor" = "none";
    "window.menuBarVisibility" = "compact";
    "window.zoomLevel" = 0;
    "breadcrumbs.enabled" = true;
    "explorer.confirmDragAndDrop" = false;

    "files.autoSave" = "afterDelay";
    "files.autoSaveDelay" = 1500;

    "editor.minimap.enabled" = true;
    "editor.minimap.renderCharacters" = false;

    "editor.formatOnSave" = true;
    "editor.formatOnPaste" = true;

    "terminal.integrated.fontFamily" = "Fira Code";
    "terminal.integrated.defaultProfile.linux" = "zsh";
    "terminal.integrated.scrollback" = 10000;

    "terminal.integrated.profiles.linux" = {
      "zsh" = {
        "path" = "zsh";
      };
      "fish" = {
        "path" = "fish";
      };
    };

    "git.enableSmartCommit" = true;
    "git.confirmSync" = false;
    "git.autofetch" = true;

    "liveServer.settings.donotShowInfoMsg" = true;
    "liveServer.settings.donotVerifyTags" = true;
    "liveServer.settings.ignoreFiles" = [
      "./imports/**"
    ];

    "telemetry.telemetryLevel" = "off";
    "workbench.enableExperiments" = false;
    "editor.inlineSuggest.enabled" = true;
    "editor.suggestSelection" = "first";

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
    "[nix]" = {
      "editor.defaultFormatter" = "jnoortheen.nix-ide";
    };

    "[css]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
    "[scss]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "[javascript]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
    "[typescript]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
    "[json]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "[cpp]" = {
      "editor.defaultFormatter" = "ms-vscode.cpptools";
    };
    "[c]" = {
      "editor.defaultFormatter" = "ms-vscode.cpptools";
    };
  };
}
