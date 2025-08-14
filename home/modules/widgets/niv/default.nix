{ pkgs, ... }:

{
  programs.eww = {
    enable = true;
    enableZshIntegration = true;
  };
}
