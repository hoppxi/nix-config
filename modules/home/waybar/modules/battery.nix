{
  programs.waybar.settings = [
    {
      "battery" = {
        "format" = "{capacity}%";
        "format-charging" = "⚡ {capacity}%";
        "interval" = 30;
      };
    }
  ];
}
