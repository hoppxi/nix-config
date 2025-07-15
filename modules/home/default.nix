{
  config,
  pkgs,
  lib,
  username,
  ...
}:

{
  imports = [
    ./hyprland/default.nix
    ./waybar/default.nix
    ./nvim/default.nix
    ./rofi/default.nix
    ./services/default.nix
    ./shell/zsh.nix
    ./shell/starship.nix
    ./mako/default.nix
    ./terminal/default.nix
    ./vscode/default.nix
    ./eww/default.nix
    ./apps.nix
    ./devtools.nix
    ./packages.nix
    ./theming.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };

  home.file.".config/scripts/updater/flake_updater.sh" = {
    source = ../../scripts/updater/updater.sh;
    executable = true;
  };
  home.file.".config/scripts/updater/kill.sh" = {
    source = ../../scripts/updater/kill.sh;
    executable = true;
  };
}
