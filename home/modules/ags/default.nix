{ inputs, pkgs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    # configDir = ../ags;
    extraPackages = with pkgs; [
      inputs.astal.packages.${pkgs.system}.battery
      fzf
    ];
  };

  home.packages = with inputs.astal.packages.${pkgs.system}; [
    io
    notifd
    apps
    # auth
    battery
    bluetooth
    cava
    hyprland
    mpris
    network
    tray
    wireplumber
    powerprofiles
  ];
}
