{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cava
    cmatrix
    pipes
    fastfetch
    tty-clock
  ];
}
