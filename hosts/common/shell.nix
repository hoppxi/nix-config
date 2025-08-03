{ pkgs, ... }:

{
  programs.zsh.enable = true;

  programs.bash.completion.enable = true;
  environment.pathsToLink = [ "/share/bash-completion" ];

  environment.shells = with pkgs; [
    zsh
    bash
  ];
}
