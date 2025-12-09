{
  programs.zed-editor.userSettings = {
    disable_ai = true;
    features.edit_prediction_provider = "none";
    enable_language_server = true;
    format_on_save = true;
    use_auto_surround = true;
    inlay_hints.enabled = true;

    terminal = {
      font_size = 13;
    };

    base_keymap = "VSCode";
    theme = {
      mode = "dark";
      dark = "Gruvbox Material";
      light = "Gruvbox Material";
    };
    icon_theme = {
      mode = "dark";
      dark = "Material Icon Theme";
      light = "Material Icon Theme";
    };
    project_panel = {
      dock = "right";
      indent_size = 15;
    };

    title_bar = {
      show_branch_icon = true;
      show_branch_name = true;
      show_project_items = true;
      show_onboarding_banner = true;
      show_user_picture = true;
      show_sign_in = true;
      show_menus = true;
    };

    buffer_font_size = 13;
    ui_font_size = 13;
    telemetry = {
      diagnostics = false;
      metrics = false;
    };

    tab_size = 2;
    hard_tabs = false;
  };
}
