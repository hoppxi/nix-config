{
  programs.vscode.profiles.default.userSettings = {
    "editor.fontFamily" = "JetBrainsMono Nerd Font";
    "editor.fontSize" = 14;
    "editor.lineHeight" = 20;
    "editor.smoothScrolling" = true;

    "workbench.colorTheme" = "Gruvbox Material Dark";
    "workbench.iconTheme" = "material-icon-theme";
    # "workbench.productIconTheme" = "fluent-icons";

    "workbench.sideBar.location" = "right";
    "workbench.startupEditor" = "none";
    "window.menuBarVisibility" = "compact";
    "window.zoomLevel" = -1;
    "breadcrumbs.enabled" = true;
    "explorer.confirmDragAndDrop" = false;

    # "files.autoSave" = "afterDelay";
    # "files.autoSaveDelay" = 1500;

    "editor.minimap.enabled" = true;
    "editor.minimap.renderCharacters" = false;

    "editor.formatOnSave" = true;
    "editor.formatOnPaste" = true;

    "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
    "terminal.integrated.fontSize" = 14;
    "terminal.integrated.defaultProfile.linux" = "fish";
    "terminal.integrated.scrollback" = 10000;

    "terminal.integrated.profiles.linux" = {
      "fish" = {
        "path" = "fish";
      };
    };

    "git.enableSmartCommit" = true;
    "git.confirmSync" = false;
    "git.autofetch" = true;

    # "liveServer.settings.donotShowInfoMsg" = true;
    # "liveServer.settings.donotVerifyTags" = true;
    # "liveServer.settings.ignoreFiles" = [
    #   "./imports/**"
    # ];

    "telemetry.telemetryLevel" = "off";
    "workbench.enableExperiments" = false;
    "editor.inlineSuggest.enabled" = true;
    "editor.suggestSelection" = "first";
    "editor.defaultFormatter" = "esbenp.prettier-vscode";

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

    # "[cpp]" = {
    #   "editor.defaultFormatter" = "ms-vscode.cpptools";
    # };
    # "[c]" = {
    #   "editor.defaultFormatter" = "ms-vscode.cpptools";
    # };
  };
}
