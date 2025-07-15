{ config, pkgs, ... }:

let
  toggleWigdet = import ./toggle-widget.nix;

  cmd = toggleWigdet.tw "quicksettings";
in
{
  network = {
    interval = 5;

    format-wifi = "{icon}";
    format-ethernet = "󰈀";
    format-disconnected = "󰖪";
    format-disabled = "󱚼";
    tooltip = true;

    on-click = cmd;

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
        "󰤯" # 0–25% (no signal)
        "󰤟" # 26–50%
        "󰤢" # 51–75%
        "󰤨" # 76–100% (full)
      ];
    };
  };
}
