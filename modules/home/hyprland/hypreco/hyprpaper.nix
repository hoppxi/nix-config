{
  config,
  lib,
  username,
  ...
}:

let
  wpDir = "${config.home.homeDirectory}/nix-config/assets/wallpapers";
in
{
  home.file.".local/share/hyprpaper/wallpapers".source = config.lib.file.mkOutOfStoreSymlink wpDir;
  home.file.".local/share/hyprpaper/wallpapers".recursive = true;

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      preload = [
        "/home/${username}/.local/share/hyprpaper/wallpapers/wallpaper1.jpg"
        "/home/${username}/.local/share/hyprpaper/wallpapers/wallpaper2.jpg"
      ];
      wallpaper = [
        "eDP-1,/home/${username}/.local/share/hyprpaper/wallpapers/wallpaper1.jpg" # run `hyprctl monitors` to find your monitor
        ",/home/${username}/.local/share/hyprpaper/wallpapers/wallpaper2.jpg"
      ];
      splash = false;
    };
  };

  home.file.".config/hypr/scripts/random-wallpaper.sh" = {
    source = ../../../../scripts/random-wallpaper.sh;
    executable = true;
  };
}
