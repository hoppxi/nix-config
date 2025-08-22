{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Fun
    cmatrix
    pipes
    tty-clock
    cava

    # Fetch
    fastfetch
  ];
}
