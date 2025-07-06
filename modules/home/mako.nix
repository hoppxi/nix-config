{ pkgs, config, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      background-color = "#1e1e2e77";
      border-color = "#89b4fa";
      text-color = "#cdd6f4";
      border-radius = 8;
      border-size = 2;
      font = "JetBrainsMono Nerd Font 10";
      default-timeout = 5000;
      anchor = "top-right";
      padding = "10";
      width = 300;
    };
  };
}
