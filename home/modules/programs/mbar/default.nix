{ inputs, ... }:

let
  colors = import ../../theme/colors.nix;
  toMbarHex =
    hex: aplha:
    let
      pureHex = builtins.substring 1 (builtins.stringLength hex) hex;
    in
    "${pureHex}${aplha}";
in

{

  imports = [
    inputs.mbar.homeModules.default
  ];

  programs.mbar = {
    enable = true;
    enable-service = true;
    settings = {
      bar = {
        height = 30;
        font-family = "Inter";
        font-size = 9;
        bg = toMbarHex colors.background "08";
        fg = toMbarHex colors.on-background "dd";
      };

      modules-layout = {
        left = "custom/os custom/separator window";
        center = "network custom/separator audio custom/separator battery";
        right = "date";
      };

      modules = {
        # custom modules
        "custom/os" = {
          format = "";
          font-size = 15;
        };
        "custom/separator" = {
          format = "[cmd[-1: echo ' water_drop ']]";
          font-size = 8;
          font-family = "Material Symbols Outlined";
        };

        # builtin modules
        "window".format = "[workspace] . [title]";
        "window".max-length = 30;
        "date".format = "[%I:%M%P, %a %b %d]";
        "audio".format = "Vol [level]%";
        "network".format = "Net [ssid] [strength]%";
        "battery".format = "Bat [level]% ([status])";
      };
    };
  };
}
