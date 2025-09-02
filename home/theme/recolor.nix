{
  config,
  inputs,
  pkgs,
  system,
  ...
}:

{
  imports = [ inputs.recolor.homeModules.recolor ];
  services.recolor = {
    enable = true;
    start-with-hyprland = false;
    swww-cache = "${config.xdg.cacheHome}/swww";
    theme = "dark";
    nix-theme-file = "/";
    json-theme-file = "/";
    css-theme-file = "/";
    scss-theme-file = "/";
  };
}
