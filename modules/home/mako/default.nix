{ pkgs, config, ... }:

{
  services.mako = {
    enable = true;

    settings = {
      # General styling
      background-color = "#1e1e2e22";
      border-color = "#89b4fa";
      text-color = "#cdd6f4";
      border-radius = 12;
      border-size = 2;
      font = "JetBrainsMono Nerd Font 11";
      default-timeout = 7000;
      padding = "16";
      margin = "12";
      width = 360;
      max-icon-size = 64;
      icon-path = "${pkgs.papirus-icon-theme}/share/icons/Papirus";
      anchor = "top-right";

      # Behavior
      layer = "overlay";
      group-by = "app-name";
      ignore-timeout = false;
      history = true;
      markup = true;
      actions = true;
      max-visible = 3;

      # Per urgency level
      "urgency=low" = {
        background-color = "#1e1e2eaa";
        border-color = "#6c7086";
        text-color = "#a6adc8";
        default-timeout = 3000;
      };

      "urgency=high" = {
        background-color = "#f38ba8cc";
        border-color = "#f38ba8";
        text-color = "#1e1e2e";
        default-timeout = 0;
      };
    };
  };
}
