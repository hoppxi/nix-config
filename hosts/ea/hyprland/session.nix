{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  services = {
    dbus.enable = true;
    seatd.enable = true;

    # getty.greetingLine = "Welcome to Nixos @ea!";
    # getty.helpLine = "Enter username and password to login.\nRun nixos-help for Nixos manual";
    # greetd = {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${pkgs.hyprland}/bin/Hyprland";
    #       user = "greeter";
    #     };
    #   };
    # };
    
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  environment.systemPackages = with pkgs; [
    hyprland
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
  ];
}

