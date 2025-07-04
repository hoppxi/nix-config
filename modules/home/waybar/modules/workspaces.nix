{
  programs.waybar.settings = [
    {
      "hyprland/workspaces" = {
        "format" = "{icon}";
        "on-click" = "hyprctl dispatch workspace e+1";
      };
    }
  ];
}
