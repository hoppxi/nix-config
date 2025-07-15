## My Nixos

![img](assets/screenshots/hyprland3.png)

> Currently developing eww widgets for rofi replacement

# Nixos + hyprland on the sky

> Managed entirely via flakes and home-manager; no config files in `~/.config` just symlinks!

## Features

- **Hyprland** with sky blur, animations.
- **Waybar** with blur, sky colors, and clean modules.
- **Mako** for themed notifications.
- **Rofi and EWW** menus styled with sky gradient and blur.
- **Modular flake** setup — easy to maintain and extend.
- **Kitty**, **Thunar**, **Brave**, **VSCode**, **Neovim**, and more fully themed.
- **SDDM** with Sugar Candy + Sky accent theme.
- GTK apps themed with matching Sky look.
- Purely declarative with **Home Manager** and **Nix Flakes**.

## Getting Started

> Prerequisites: You must be using **NixOS Unstable** and have **flakes** enabled.

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourname/nix-config ~/nix-config
   cd ~/nix-config
   ```

2. **Edit your `flake.nix`** to point to your hostname and username. Just that!

3. **Copy your `hardware-configuration.nix`**

   > Important: this is for my pc. so for your computer, you should use yours.

   ```bash
   rm modules/system/hardware-configuration.nix
   sudo cp /etc/nixos/hardware-configuration.nix ~/nix-config/modules/system/hardware-configuration.nix
   ```

   > Important: change your username and email for git found at `modules/home/git/default.nix`

4. **Rebuild your system and Activate home-manager**

   ```bash
   sudo nixos-rebuild switch --flake .#your-hostname
   home-manager switch --flake .#your-username
   ```

## Screenshots

| hyprland                                 |                                         |                                          |
| ---------------------------------------- | --------------------------------------- | ---------------------------------------- |
| ![img](assets/screenshots/hyprland2.png) | ![img](assets/screenshots/hyprland.png) | ![img](assets/screenshots/hyprland4.png) |

| waybar                                |
| ------------------------------------- |
| ![img](assets/screenshots/waybar.png) |

<!-- | Power menu                           | wifi menu                           | battery                                | backlight                                | volume                                |
| ------------------------------------ | ----------------------------------- | -------------------------------------- | ---------------------------------------- | ------------------------------------- |
| ![img](assets/screenshots/power.png) | ![img](assets/screenshots/wifi.png) | ![img](assets/screenshots/battery.png) | ![img](assets/screenshots/backlight.png) | ![img](assets/screenshots/volume.png) |

| mpris                                | screenshot                                | clipboard                                | Launcher                                | mako                                |
| ------------------------------------ | ----------------------------------------- | ---------------------------------------- | --------------------------------------- | ----------------------------------- |
| ![img](assets/screenshots/mpris.png) | ![img](assets/screenshots/screenshot.png) | ![img](assets/screenshots/clipboard.png) | ![img](assets/screenshots/launcher.png) | ![img](assets/screenshots/mako.png) | -->

| Music                                     | Powermenu                                | Quick settings                         | Launcher                                | mako                                |
| ----------------------------------------- | ---------------------------------------- | -------------------------------------- | --------------------------------------- | ----------------------------------- |
| ![img](assets/screenshots/with-music.png) | ![img](assets/screenshots/powermenu.png) | ![img](assets/screenshots/with-qs.png) | ![img](assets/screenshots/launcher.png) | ![img](assets/screenshots/mako.png) |

| vscode                                | neovim                                | gtk                                | kitty                                |
| ------------------------------------- | ------------------------------------- | ---------------------------------- | ------------------------------------ |
| ![img](assets/screenshots/vscode.png) | ![img](assets/screenshots/neovim.png) | ![img](assets/screenshots/gtk.png) | ![img](assets/screenshots/kitty.png) |

## Credits

- Hyprland
- [Mechabar](https://github.com/sejjy/mechabar) for scripts
- [Rofi](https://github.com/adi1090x/rofi) for themes and scripts
