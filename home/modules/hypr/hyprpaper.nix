{
  config,
  lib,
  ...
}:

{
  home.file.".local/share/pictures/wallpapers-preset" = {
    source = ../../../assets/images/wallpapers-preset;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      preload = [
        "${config.home.homeDirectory}/.local/share/pictures/wallpapers-preset/wallpaper1.jpg"
        "${config.home.homeDirectory}/.local/share/pictures/wallpapers-preset/wallpaper2.jpg"
      ];
      wallpaper = [
        "eDP-1,${config.home.homeDirectory}/.local/share/pictures/wallpapers-preset/wallpaper1.jpg"
        ",${config.home.homeDirectory}/.local/share/pictures/wallpapers-preset/wallpaper2.jpg"
      ];
      splash = false;
    };
  };
}
