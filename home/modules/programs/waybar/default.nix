{ lib, ... }:

let
  colors = import ../../theme/colors.nix;
  hexToRgba =
    hex: alpha:
    let
      pureHex = lib.removePrefix "#" hex;

      r = lib.fromHexString (builtins.substring 0 2 pureHex);
      g = lib.fromHexString (builtins.substring 2 2 pureHex);
      b = lib.fromHexString (builtins.substring 4 2 pureHex);
    in
    "rgba(${toString r}, ${toString g}, ${toString b}, ${alpha})";
in

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 15;
        margin-top = 5;
        margin-left = 5;
        margin-right = 5;
        margin-bottom = 1;

        modules-left = [
          "custom/menu"
          "custom/separator"
          "hyprland/workspaces"
          "custom/separator"
          "group/mprisbtn"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "tray"
          "clock"
          "custom/separator"
          "group/quicksettings"
        ];

        "custom/separator" = {
          format = "<span font_family='Material Symbols Rounded' font_size='8pt'>water_drop</span>";
          tooltip = false;
        };

        "custom/menu" = {
          format = " ";
          on-click = "wofi --show drun";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = 10;
          };
          show-special = true;
          format = "{icon}";
          format-icons = {
            active = "<span font_family='Material Symbols Rounded' font_size='12pt'>stroke_full</span>";
            default = "<span font_family='Material Symbols Rounded' font_size='12pt'>stroke_partial</span>";
            empty = "<span font_family='Material Symbols Rounded' font_size='12pt'>circle</span>";
            special = "<span font_family='Material Symbols Rounded' font_size='12pt'>kid_star</span>";
            urgent = "<span font_family='Material Symbols Rounded' font_size='12pt'>error_med</span>";
          };
        };

        "group/mprisbtn" = {
          orientation = "horizontal";
          modules = [
            "custom/mpristrigger"
            "mpris"
          ];
        };

        "custom/mpristrigger" = {
          format = "<span font_family='Material Symbols Rounded' font_size='12pt'>music_note</span>";
        };

        "mpris" = {
          format = "<span rise='1000'>{dynamic}</span>";
          status-icons = {
            paused = "<span font_family='Material Symbols Rounded' font_size='12pt' rise='-3000'>play_arrow</span>";
            playing = "<span font_family='Material Symbols Rounded' font_size='12pt' rise='-3000'>music_note</span>";
          };
          dynamic-order = [
            "title"
            "artist"
          ];
          max-length = 20;
        };

        "hyprland/window" = {
          max-length = 30;
          separate-outputs = true;
          icon = true;
          icon-size = 14;
          rewrite = {
            "" = "Desktop";
          };
        };

        "tray" = {
          spacing = 5;
        };

        "clock" = {
          format = "{:%I:%M %a, %b %d}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        "group/quicksettings" = {
          orientation = "horizontal";
          modules = [
            "network"
            "pulseaudio"
            "battery"
          ];
        };

        "network" = {
          format-wifi = "{icon}";
          format-ethernet = "<span font_family='Material Symbols Rounded' font_size='12pt'>lan</span>";
          format-disconnected = "<span font_family='Material Symbols Rounded' font_size='12pt'>wifi_off</span>";
          format-icons = {
            default = [
              "<span font_family='Material Symbols Rounded' font_size='12pt'>wifi_1_bar</span>"
              "<span font_family='Material Symbols Rounded' font_size='12pt'>wifi_2_bar</span>"
              "<span font_family='Material Symbols Rounded' font_size='12pt'>wifi</span>"
              "<span font_family='Material Symbols Rounded' font_size='12pt'>android_wifi_4_bar</span>"
            ];
          };
          tooltip-format = "{essid} ({signalStrength}%)";
          on-click = "nm-connection-editor";
        };

        "pulseaudio" = {
          format = "{icon}";
          format-muted = "<span font_family='Material Symbols Rounded' font_size='14pt'>volume_off</span>";
          format-icons = {
            default = [
              "<span font_family='Material Symbols Rounded' font_size='14pt'>volume_mute</span>"
              "<span font_family='Material Symbols Rounded' font_size='14pt'>volume_down</span>"
              "<span font_family='Material Symbols Rounded' font_size='14pt'>volume_up</span>"
            ];
          };
          tooltip-format = "{desc} ({volume}%)";
          on-click = "pavucontrol";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "<span font_family='Material Symbols Rounded' font_size='14pt'>battery_android_frame_bolt</span>";
          format-plugged = "<span font_family='Material Symbols Rounded' font_size='14pt'>battery_android_frame_bolt</span>";
          format-icons = [
            "<span font_family='Material Symbols Rounded' font_size='14pt'>battery_android_alert</span>"
            "<span font_family='Material Symbols Rounded' font_size='14pt'>battery_android_frame_1</span>"
            "<span font_family='Material Symbols Rounded' font_size='14pt'>battery_android_frame_2</span>"
            "<span font_family='Material Symbols Rounded' font_size='14pt'>battery_android_frame_3</span>"
            "<span font_family='Material Symbols Rounded' font_size='14pt'>battery_android_frame_4</span>"
            "<span font_family='Material Symbols Rounded' font_size='14pt'>battery_android_frame_5</span>"
            "<span font_family='Material Symbols Rounded' font_size='14pt'>battery_android_frame_6</span>"
            "<span font_family='Material Symbols Rounded' font_size='14pt'>battery_android_frame_full</span>"
          ];
          tooltip-format = "{capacity}%, {time} Remaining";
        };
      };
    };

    style = ''
      * {
        padding: 0;
        margin: 0;
        color: ${colors.on-background};
        background-color: transparent;
        font-family: Inter;
        font-size: 13px;
        transition: 0.3s;
      }

      window#waybar {
        background: transparent;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        background-color: ${hexToRgba colors.background "0.6"};
        border: 1px solid ${colors.primary};
        border-radius: 20px;

        transition-property: background-color;
        transition-duration: 0.5s;
        padding: 2px 10px;
      }

      tooltip {
        background-color: ${hexToRgba colors.background "0.6"};
        border-radius: 10px;
        border: 1px solid ${colors.primary};
      }

      .modules-left {
        padding-left: 10px;
      }
      .modules-right {
        padding-right: 10px;
      }

      #custom-menu:hover {
        opacity: 0.8;
      }

      #workspaces button * {
        color: ${colors.secondary};
        padding-left: 1px;
      }

      #workspaces button.active * {
        color: ${colors.primary};
      }

      #workspaces button.empty * {
        color: ${hexToRgba colors.on-background "0.6"};
      }

      #battery.warning {
        color: rgba(232, 197, 56, 1);
      }
      #battery.critical {
        color: ${colors.error};
      }
      #battery.full {
        color: rgba(134, 219, 78, 1);
      }

      #network,
      #pulseaudio {
        padding-right: 4px;
      }

      #tray menu {
        background-color: ${hexToRgba colors.background "0.6"};
        border-radius: 10px;
        border: 1px solid ${colors.primary};
        padding: 5px;
      }

    '';
  };
}
