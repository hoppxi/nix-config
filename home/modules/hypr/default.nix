{
  imports = [
    ./appearance.nix
    ./env.nix
    ./exec.nix
    ./hyprcursor.nix
    ./hypridle
    ./wallpaper.nix
    ./hyprlock.nix
    ./input.nix
    ./keybinds.nix
    ./monitors.nix
    ./packages.nix
    ./windows.nix
    # ./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

}
