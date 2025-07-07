{ config, pkgs, ... }:

{
  backlight = {
    format = "{icon}";
    format-icons = [
      "󰃚"  # 0–20%
      "󰃝"  # 21–40%
      "󰃞"  # 41–60%
      "󰃟"  # 61–80%
      "󰃠"  # 81–100%
    ];

    tooltip = true;
    tooltip-format = ''
      🔆 Brightness: {percent}%
      Raw: {raw}/{max}
      Device: {device}
    '';

    scroll-step = 5;

    on-click = "brightnessctl set 100%";
    on-click-right = "brightnessctl set 10%";
    on-scroll-up = "brightnessctl set +5%";
    on-scroll-down = "brightnessctl set 5%-";
  };
}
