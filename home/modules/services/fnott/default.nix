let
  colors = import ../../theme/colors.nix;

  toFnottHex =
    hex: aplha:
    let
      pureHex = builtins.substring 1 (builtins.stringLength hex) hex;
    in
    "${pureHex}${aplha}";
in
{
  services.fnott = {
    enable = true;
    settings = {
      main = {
        anchor = "top-right";
        stacking-order = "top-down";
        min-width = 300;
        max-width = 300;

        edge-margin-vertical = 5;
        edge-margin-horizontal = 5;
        notification-margin = 10;
        border-size = 1;
        border-radius = 20;

        background = toFnottHex colors.surface "60";
        border-color = toFnottHex colors.primary "ff";

        title-color = toFnottHex colors.primary "ff";
        summary-color = toFnottHex colors.on-surface "ff";
        body-color = toFnottHex colors.on-surface-variant "ff";

        title-font = "Sans:weight=bold:size=12";
        summary-font = "Sans:size=11";
        body-font = "Sans:size=10";

        max-icon-size = 48;
      };

      low = {
        background = toFnottHex colors.surface-container-low "60";
        border-color = toFnottHex colors.outline "ff";
      };

      critical = {
        background = toFnottHex colors.error-container "60";
        border-color = toFnottHex colors.error "ff";
        default-timeout = 0;
      };
    };
  };
}
