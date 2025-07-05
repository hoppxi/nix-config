{ config, pkgs, lib, inputs, username, ... }:

{
  imports = [
    ../modules/home/default.nix
  ];

  programs.home-manager.enable = true;
  
  dconf.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    BROWSER = "brave";
    QT_QPA_PLATFORMTHEME = lib.mkForce "gtk3";
    GTK_THEME = "Catppuccin-Mocha-Compact-Lavender-Dark";
  };
}
