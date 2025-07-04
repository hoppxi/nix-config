{ config, pkgs, lib, username, ... }:

{
  imports = [
    ./hyprland/default.nix
    ./waybar/default.nix
    ./nvim/default.nix
    ./rofi/default.nix
    ./shell/zsh.nix
    ./shell/starship.nix
    ./mako.nix
    ./terminal.nix
    ./theming.nix
    ./vscode.nix
    ./apps.nix
    ./devtools.nix
    ./packages.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };
}
