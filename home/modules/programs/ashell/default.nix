{
  programs.ashell = {
    enable = true;
    settings = {
      position = "Top";
      enable_esc_key = true;

      appearance = {
        style = "";
        font_name = "Inter";
        scale = 1;
        success_color = "#b8bb26";
        text_color = "#ebdbb2";

        menu = {
          opacity = 0.9;
          backdrop = 0.3;
        };

        primary_color = {
          base = "#fabd2f";
          text = "#1d2021";
        };

        danger_color = {
          base = "#fb4934";
          weak = "#fe8019";
        };

        background_color = {
          base = "#1d2021";
          weak = "#32302f"; # lighter dark
          strong = "#504945";
        };

        secondary_color = {
          base = "#282828";
          strong = "#3c3836";
        };
      };

      workspace_colors = [
        "#fabd2f"
        "#83a598"
        "#d3869b"
      ];

      modules = {
        left = [
          "appLauncher"
          "Workspaces"
        ];

        center = [
          "WindowTitle"
        ];

        right = [
          "Tray"
          "MediaPlayer"
          "Clock"
          "Settings"
        ];
      };

      CustomModule = [
        {
          name = "appLauncher";
          icon = "󱗼";
          command = "anyrun";
        }
      ];

      settings = {
        app_launcher_cmd = "anyrun";
      };
    };
  };
}
