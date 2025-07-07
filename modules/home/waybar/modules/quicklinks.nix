{ config, pkgs, ... }: 

{
  "group/quicklinks" = {
    orientation = "horizontal";
    modules = [
      "custom/browser"
      "custom/github"
      "custom/youtube"
      "custom/editor"
    ];
  };

  "custom/browser" = {
    format = "";
    tooltip = true;
    tooltip-format = "Brave";
    on-click = "brave";
  };

  "custom/github" = {
    format = "";
    tooltip = true;
    tooltip-format = "GitHub";
    on-click = "xdg-open https://github.com";
  };

  "custom/youtube" = {
    format = "";
    tooltip = true;
    tooltip-format = "YouTube";
    on-click = "xdg-open https://youtube.com";
  };

  "custom/editor" = {
    format = "";
    tooltip = true;
    tooltip-format = "vscode";
    on-click = "code";
  };
}
