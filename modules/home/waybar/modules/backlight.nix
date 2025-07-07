{ config, pkgs, ... }:

{
  backlight = {
    format = "{icon}";
    format-icons = [
      "󰃞"  # 0–20%
      "󰃟"  # 21–40% 
      "󰃝"  # 41–60%
      "󰃠"  # 61–80%
      "󰃚"  # 81–100%
    ];

    tooltip = true;
    tooltip-format = ''
      Brightness: {percent}%
    '';

    scroll-step = 2;

    on-click-middle = "brightnessctl set 100%";
    on-click-right = "brightnessctl set 10%";
    on-click = "~/.config/rofi/scripts/backlight.sh";
  };
}
