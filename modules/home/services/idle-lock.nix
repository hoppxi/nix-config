{ config, pkgs, ... }:

let
  lockScript = "${config.home.homeDirectory}/.config/scripts/services/idle-lock.sh";
in {
  systemd.user.services.hyprlock-once = {
    Unit.Description = "Run hyprlock once after idle period";
    Service.ExecStart = "${lockScript}";
    Service.Type = "oneshot";
  };

  systemd.user.timers.hyprlock-once = {
    Unit.Description = "Lock screen after 5 minutes idle (once)";
    Timer = {
      OnActiveSec = "5min";
      AccuracySec = "10s";
    };
    Install.WantedBy = [ "default.target" ];
  };
}


# systemctl --user start hyprlock-once.timer