{ config, pkgs, ... }:

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
      "gtk-application-prefer-dark-theme" = true;
    };
    gtk4.extraConfig = {
      text = ''gtk-application-prefer-dark-theme=1'';
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk"; # use gtk (through gtk2)
    style = {
      name = "gtk2";
      package = pkgs.libsForQt5.breeze-qt5; # Breeze style engine for Qt5
    };
  };

}
