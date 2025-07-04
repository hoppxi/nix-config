{ inputs, ... }: {

  imports = [
    ../modules/home/apps.nix
    ../modules/home/git.nix
    ../modules/home/theming.nix
    ../modules/home/terminal.nix
    ../modules/home/devtools.nix
    ../modules/home/packages.nix
    ../modules/home/rofi
    ../modules/home/mako.nix
    ../modules/home/shell
    ../modules/home/nvim
    ../modules/home/vscode.nix
    ../modules/home/hyprland
    ../modules/home/waybar
  ];
}
