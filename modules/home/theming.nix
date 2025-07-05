{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = (pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        variant = "mocha";
        size = "compact";
      });
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 10;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  xdg.configFile."gtk-4.0/assets".source =
    "${pkgs.catppuccin-gtk}/share/themes/Catppuccin-Mocha-Compact-Lavender-Dark/gtk-4.0/assets";
  xdg.configFile."gtk-4.0/gtk.css".source =
    "${pkgs.catppuccin-gtk}/share/themes/Catppuccin-Mocha-Compact-Lavender-Dark/gtk-4.0/gtk.css";
  xdg.configFile."gtk-4.0/gtk-dark.css".source =
    "${pkgs.catppuccin-gtk}/share/themes/Catppuccin-Mocha-Compact-Lavender-Dark/gtk-4.0/gtk-dark.css";
}
