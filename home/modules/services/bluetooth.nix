{ config, ... }:

let
  bluetoothScript = "${config.home.homeDirectory}/.config/scripts/services/bluetooth.sh";
in
{

  systemd.user.services.bluetooth-notify = {
    Unit.Description = "Bluetooth Notification Service";
    Service.ExecStart = "${bluetoothScript}";
    Service.Type = "oneshot";
  };

  systemd.user.timers.bluetooth-notify = {
    Unit.Description = "Run bluetooth-notify every 30 second";
    Timer = {
      OnBootSec = "30s";
      OnUnitActiveSec = "30s";
      AccuracySec = "10s";
    };
    Install.WantedBy = [ "default.target" ];
  };
}

# systemctl --user daemon-reexec
# systemctl --user enable --now bluetooth-notify.timer
