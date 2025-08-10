{ config, lib, ... }:

let
  wpSrc = ../../../assets/images/wallpapers;
  dir = builtins.readDir wpSrc;
  files = lib.filter (name: dir.${name} == "regular") (builtins.attrNames dir);
  preloadPaths = map (name: "${config.home.homeDirectory}/.config/backgrounds/${name}") files;
in
{
  home.file.".config/backgrounds" = {
    source = wpSrc;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      preload = preloadPaths;
      wallpaper = [
        "eDP-1,${config.home.homeDirectory}/.config/backgrounds/wallpaper1.jpg"
      ];
      splash = false;
    };
  };
}
