{ config, pkgs, ... }:

{
  battery = {
    interval = 30;

    format = "{icon}";
    format-charging = "{icon}";
    format-plugged = "{icon}";
    format-full = ""; 
    tooltip = true;
    tooltip-format-charging = ''
      ⚡ {capacity}%
      Until full: {time}
      Health: {health}
    '';
    tooltip-format-discharging = ''
      ⚡ {capacity}%
      Until empty: {time}
      Health: {health}
    '';
    tooltip-format-full = ''
      ⚡ {capacity}% (Full)
      Health: {health}
    '';
    
    states = {
      "critical" = 10;
      "warning" = 25;
      "good" = 90;
    };

    format-icons = [
      ""  # 0–10%
      ""  # 11–25%
      ""  # 26–50%
      ""  # 51–75%
      ""  # 76–100%
    ];
  };
}
