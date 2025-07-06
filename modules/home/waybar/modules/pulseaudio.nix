{ config, pkgs, ... }:

{
  pulseaudio = {
    scroll-step = 1;
    format = "{icon} {volume}%";
    format-bluetooth = "{volume}% {icon} {format_source}";
    format-bluetooth-muted = " {icon} {format_source}";
    format-muted = " {format_source}";
    format-source = "{volume}% ";
    format-source-muted = "";
    format-icons = {
      headphone = "";
      hands-free = "";
      headset = "";
      phone = "";
      portable = "";
      car = "";
      default = ["" " " " "];
    };
    
    tooltip = true;
    tooltip-format = "{desc}\nVolume: {volume}%";

    on-click = "pavucontrol";
  };
}