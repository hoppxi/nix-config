{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [ inputs.hm-color.homeModules.hm-color ];
  services.hm-color = {
    enable = true;
    run-in-hyprland = false;
    swww-cache = "${config.xdg.cacheHome}/swww";
    nix-theme-file = "${config.home.homeDirectory}/nix-config/home/theme/default.nix";
    flake-path = "${config.home.homeDirectory}/nix-config#hoppxi@ea";
    git-commit = false;
  };
}
