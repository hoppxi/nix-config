{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cmatrix
    pipes
    tty-clock
    cava
    fastfetch
  ];
}
