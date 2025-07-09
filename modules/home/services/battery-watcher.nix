{ config, pkgs, ... }:

let
  batteryScript = "${config.home.homeDirectory}/.config/scripts/services/battery-watcher.sh";
in {
  systemd.user.services.battery-notify = {
    Unit.Description = "Battery Notification Service";
    Service.ExecStart = "${batteryScript}";
    Service.Type = "oneshot";
  };

  systemd.user.timers.battery-notify = {
    Unit.Description = "Run battery-notify every minute";
    Timer = {
      OnBootSec = "30s";
      OnUnitActiveSec = "1min";
      AccuracySec = "10s";
    };
    Install.WantedBy = [ "default.target" ];
  };
}

# systemctl --user daemon-reexec
# systemctl --user start battery-notify.timer
