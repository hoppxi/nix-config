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
    format = "";
    tooltip = "Firefox";
    on-click = "firefox";
  };

  "custom/github" = {
    format = "";
    tooltip = "GitHub";
    on-click = "xdg-open https://github.com";
  };

  "custom/youtube" = {
    format = "";
    tooltip = "YouTube";
    on-click = "xdg-open https://youtube.com";
  };

  "custom/editor" = {
    format = "";
    tooltip = "Launch VSCode";
    on-click = "code";
  };
}
