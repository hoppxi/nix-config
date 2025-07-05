# my-nixos-config

NixOS config using flakes with Hyprland, home-manager, and a bunch of riced apps

## what's inside

- hyprland + wayland apps
- home-manager + flake setup
- vscode, nvim, rofi, mako, and more
- themes applied (catppuccin mostly)
- all config managed in nix (no random dotfiles in `~/.config`)

## goals

- make it clean, modular, and fully declarative
- show all useful info: battery, wifi, clock, screen recorder notifications etc.
- theme everything just with nix

## TODO

- [ ] write bash scripts for notifications (e.g. battery, network)
- [ ] add keybinds needed for Hyprland
- [ ] make it _mine_: wallpapers (Hyprpaper), colors, layout
- [ ] waybar customization
- [ ] rofi customization (launcher, power menu, emoji, etc.)
- [ ] neovim full rice (LSP, UI, plugins)
- [ ] vscode tweaks (extensions, settings.json)
- [ ] gtk apps look consistent
- [ ] add more modules and scripts
- [ ] test and polish

## how to get started

```bash
git clone https://github.com/yourname/nix-config ~/nix-config
cd ~/nix-config

# change to your username and hostname in flake.nix and run
nixos-rebuild --flake ~/nix-config#your-hostname switch
home-manager --flake ~/nix-config#your-username@your-hostname switch
```
