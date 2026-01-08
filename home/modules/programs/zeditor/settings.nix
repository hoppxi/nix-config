{
  programs.zed-editor.userSettings = {
    "formatter" = "auto";
    "base_keymap" = "VSCode";
    "buffer_font_size" = 12;
    "disable_ai" = true;
    "enable_language_server" = true;
    "features" = {
      "edit_prediction_provider" = "none";
    };
    "format_on_save" = "on";
    "hard_tabs" = false;
    "icon_theme" = {
      "dark" = "Material Icon Theme";
      "light" = "Material Icon Theme";
      "mode" = "dark";
    };
    "inlay_hints" = {
      "enabled" = true;
    };
    "project_panel" = {
      "dock" = "right";
      "indent_size" = 15;
      "file_icons" = true;
      "folder_icons" = true;
    };
    "tab_size" = 2;
    "telemetry" = {
      "diagnostics" = false;
      "metrics" = false;
    };
    "terminal" = {
      "font_size" = 12;
      "font_family" = "JetBrainsMono Nerd Font";
    };
    "theme" = "Colorizer";
    "title_bar" = {
      "show_branch_icon" = true;
      "show_branch_name" = true;
      "show_menus" = true;
      "show_onboarding_banner" = true;
      "show_project_items" = true;
      "show_sign_in" = true;
      "show_user_picture" = true;
    };
    "ui_font_size" = 12;
    "use_auto_surround" = true;
    "auto_update" = false;

    "ensure_final_newline_on_save" = true;
    "preferred_line_length" = 100;
    "remove_trailing_whitespace_on_save" = true;
    "show_whitespaces" = "selection";
    "soft_wrap" = "editor_width";
    "use_autoclose" = true;

    "file_scan_exclusions" = [
      "**/.git"
      "**/node_modules"
      "**/.DS_Store"
      "**/target"
      "**/dist"
      "**/.direnv"
    ];
    "tabs" = {
      "file_icons" = true;
      "git_status" = true;
    };

    "buffer_font_family" = "JetBrainsMono Nerd Font";
    "ui_font_family" = "Inter";
  };
}
