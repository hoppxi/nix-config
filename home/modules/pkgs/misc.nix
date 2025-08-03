{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Fun
    cmatrix
    pipes
    tty-clock
    fortune
    cava

    # Fetch
    pfetch
    neofetch
    # fastfetch
  ];
}
