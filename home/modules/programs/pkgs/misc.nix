{ pkgs, ... }:

{
  home.packages = with pkgs; [

    cava

    cmatrix
    pipes
    cbonsai
    hollywood
    bastet
    asciiquarium
    boxes
    figlet
    lolcat
    toilet
    cowsay
    neofetch
    fastfetch
    tty-clock
    sl
    fortune
    ponysay
    nyancat
    oneko
    jp2a
    asciinema
  ];
}
