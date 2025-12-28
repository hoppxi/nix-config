{ pkgs, inputs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  services = {
    dbus.enable = true;
    seatd.enable = true;

    getty.greetingLine = "Welcome to Nixos @ea!";
    getty.helpLine = "Enter username and password to login.";
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${pkgs.hyprland}/bin/Hyprland";
          user = "greeter";
        };
      };
    };

  };

}
