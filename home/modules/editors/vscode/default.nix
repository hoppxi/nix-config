{ pkgs, ... }:

{
  imports = [
    ./extentions.nix
    ./settings.nix
  ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
  };
}
