{
  imports = [
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
