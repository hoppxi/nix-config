{
  config,
  pkgs,
  lib,
  inputs,
  username,
  ...
}:

{
  imports = [
    ../modules/home/default.nix
  ];

  programs.home-manager.enable = true;
}
