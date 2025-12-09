{
  imports = [

    ./hyprcursor.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprsunset.nix

    ./general.nix
    ./keybinds.nix
    ./windows.nix
    ./appearance.nix
    # ./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

}
