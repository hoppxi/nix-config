{ config, pkgs, ... }:

{
  network = {
    interval = 5;

    format-wifi = "{icon}";
    format-ethernet = "󰈀";
    format-disconnected = "󰖪";
    tooltip = true;

    on-click = "~/.config/rofi/scripts/wifi.sh";

    tooltip-format-wifi = ''
      SSID: {essid}
      Interface: {ifname}
      Signal Strength: {signalStrength}%
      IP: {ipaddr}
    '';

    tooltip-format-ethernet = ''
      Connected via Ethernet
      Interface: {ifname}
      IP: {ipaddr}
    '';

    tooltip-format-disconnected = ''
      No network connection
    '';

    format-icons = {
      wifi = [
        "󰤯"  # 0–25% (no signal)
        "󰤟"  # 26–50%
        "󰤢"  # 51–75%
        "󰤨"  # 76–100% (full)
      ];
    };
  };
}
