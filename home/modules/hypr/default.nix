{
  imports = [
    ./appearance.nix
    ./env.nix
    ./exec.nix
    ./hyprcursor.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./input.nix
    ./keybinds.nix
    ./monitors.nix
    ./packages.nix
    ./windows.nix
    ./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
