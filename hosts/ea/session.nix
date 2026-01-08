{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  services = {
    dbus.enable = true;
    seatd.enable = true;

    getty.greetingLine = "Welcome @ea!";
    getty.helpLine = "";
  };

  environment.loginShellInit = ''
    if [ "$(tty)" = "/dev/tty1" ]; then
      exec ${pkgs.hyprland}/bin/start-hyprland
    fi
  '';
}
