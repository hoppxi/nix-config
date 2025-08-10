{ config, lib, ... }:

let

  capitalize =
    s:
    if s == "" then
      ""
    else
      (lib.strings.toUpper (lib.strings.substring 0 1 s))
      + (lib.strings.substring 1 (lib.strings.stringLength s - 1) s);

  mkNotifyService = name: scriptPath: interval: {
    systemd.user.services."${name}-notify" = {
      Unit.Description = "${capitalize name} Notification Service";
      Service.ExecStart = scriptPath;
      Service.Type = "oneshot";
    };

    systemd.user.timers."${name}-notify" = {
      Unit.Description = "Run ${name}-notify every ${interval}";
      Timer = {
        OnBootSec = "30s";
        OnUnitActiveSec = interval;
        AccuracySec = "10s";
      };
      Install.WantedBy = [ "default.target" ];
    };
  };

  homeDir = config.home.homeDirectory;

  servicesList = [
    {
      name = "bluetooth";
      script = "bluetooth.sh";
      interval = "30s";
    }
    {
      name = "battery";
      script = "battery.sh";
      interval = "1min";
    }
    {
      name = "network";
      script = "network.sh";
      interval = "30s";
    }
  ];

  combinedServices = lib.foldl' (
    acc: s:
    lib.recursiveUpdate acc (
      mkNotifyService s.name (builtins.toString "${homeDir}/.config/scripts/services/${s.script}")
        s.interval
    )
  ) { } servicesList;

in

combinedServices
