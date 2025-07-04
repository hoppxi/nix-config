{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      rust-lang.rust-analyzer
      jnoortheen.nix-ide
      ms-python.python
    ];

    userSettings = {
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontSize" = 14;
      "workbench.colorTheme" = "Default Dark+";
      "editor.formatOnSave" = true;
    };
  };
}
