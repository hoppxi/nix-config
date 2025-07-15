{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.eww = {
    enable = true;
    enableZshIntegration = true;
    configDir = ./widgets;
  };
}
