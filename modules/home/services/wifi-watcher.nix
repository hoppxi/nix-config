{ config, pkgs, ... }:

let
  networkScript = "${config.home.homeDirectory}/.config/scripts/services/wifi-watcher.sh";
in {

  systemd.user.services.network-notify = {
    Unit.Description = "Network Notification Service";
    Service.ExecStart = "${networkScript}";
    Service.Type = "oneshot";
  };

  systemd.user.timers.network-notify = {
    Unit.Description = "Run network-notify every 1 minute";
    Timer = {
      OnBootSec = "30s";
      OnUnitActiveSec = "1min";
      AccuracySec = "10s";
    };
    Install.WantedBy = [ "default.target" ];
  };
}

# systemctl --user daemon-reexec
# systemctl --user enable --now network-notify.timer
