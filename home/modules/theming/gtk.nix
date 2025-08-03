{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Orchis-Teal-Dark-Compact";
      package = pkgs.orchis-theme.override {
        tweaks = [ "compact" ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Hyprland-Cursor";
      package = pkgs.hyprcursor;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 10;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      text = ''gtk-application-prefer-dark-theme=1'';
    };
  };

}
