{ pkgs, config, ... }:

{
  services.mako = {
    enable = true;

    backgroundColor = "#1e1e2e";
    borderColor = "#89b4fa";
    textColor = "#cdd6f4";
    borderRadius = 8;
    borderSize = 2;
    font = "JetBrainsMono Nerd Font 12";
    defaultTimeout = 5000;
    anchor = "top-right";
    padding = "10";
    width = 300;
  };
}
