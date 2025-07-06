{ config, pkgs, ... }:

{
  network = {
    interval = 5;

    format-wifi = "{icon}";
    format-ethernet = "󰈀";
    format-disconnected = "";
    tooltip = true;

    tooltip-format-wifi = "{essid}\nSignal: {signalStrength}%\nIP: {ipaddr}";
    tooltip-format-ethernet = "Connected via Ethernet\nIP: {ipaddr}";
    tooltip-format-disconnected = "Disconnected";

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
