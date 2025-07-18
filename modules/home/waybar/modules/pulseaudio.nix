{ config, pkgs, ... }:

let
  toggleWigdet = import ./toggle-widget.nix;

  cmd = toggleWigdet.tw "quicksettings";
in
{
  pulseaudio = {
    scroll-step = 1;

    format = "{icon}";
    format-muted = " Muted";
    format-bluetooth = "{icon}";
    format-bluetooth-muted = "{icon} Muted";
    format-source = "{volume}% ";
    format-source-muted = "  Muted";
    on-click = cmd;

    format-icons = {
      default = [
        "" # 0–33%
        "" # 34–66%
        "" # 67–100%
      ];

      headphone = "";
      hands-free = "󰂯";
      headset = "󰋎";
      phone = "";
      portable = "";
      car = "";
      computer = "";
    };

    tooltip = true;

    tooltip-format = ''
      Device: {desc}
      Volume: {volume}%
      Mic: {format_source}
    '';

    on-click-right = "pavucontrol";
  };
}
