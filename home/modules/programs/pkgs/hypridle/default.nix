{
  config,
  lib,
  ...
}:

let
  cfg = config.services.wrHypridle;

  eventCommands = {
    dim = {
      onTimeout = "brightnessctl -s set ${cfg.lowBrightnessValue}";
      onResume = "brightnessctl -r";
    };
    lock = {
      onTimeout = "loginctl lock-session";
    };
    off = {
      onTimeout = "hyprctl dispatch dpms off";
      onResume = "hyprctl dispatch dpms on && brightnessctl -r";
    };
    suspend = {
      onTimeout = "systemctl suspend";
    };
  };

  # Turn an event+timeout into a listener attrset
  mkListener =
    { event, timeout }:
    let
      cmds = eventCommands.${event};
    in
    lib.mkMerge [
      { inherit timeout; }
      { on-timeout = cmds.onTimeout; }
      (lib.mkIf (cmds ? onResume) { on-resume = cmds.onResume; })
    ];

  # Generate all listeners from cfg.events
  listeners = map mkListener cfg.events;

in
{
  options.services.wrHypridle = {
    enable = lib.mkEnableOption "Declarative Hypridle configuration";

    lowBrightnessValue = lib.mkOption {
      type = lib.types.str;
      default = "10";
      description = "Brightness % when dimming screen.";
    };

    events = lib.mkOption {
      type = lib.types.listOf (
        lib.types.submodule {
          options = {
            event = lib.mkOption {
              type = lib.types.enum [
                "dim"
                "lock"
                "off"
                "suspend"
              ];
              description = "The idle event type.";
            };
            timeout = lib.mkOption {
              type = lib.types.int;
              description = "Idle timeout in seconds for this event.";
            };
          };
        }
      );
      default = [
        {
          event = "dim";
          timeout = 150;
        }
        {
          event = "lock";
          timeout = 300;
        }
        {
          event = "off";
          timeout = 500;
        }
        {
          event = "suspend";
          timeout = 1800;
        }
      ];
      description = "List of idle events with timeouts.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          ignore_systemd_inhibit = false;
        };

        listener = listeners;
      };
    };
  };

}
