{ pkgs, config, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      background-color = "#1e1e2e";
      border-color = "#89b4fa";
      text-color = "#cdd6f4";
      border-radius = 8;
      border-size = 2;
      font = "JetBrainsMono Nerd Font 12";
      default-timeout = 5000;
      anchor = "top-right";
      padding = "10";
      width = 300;
    };
  };
}
