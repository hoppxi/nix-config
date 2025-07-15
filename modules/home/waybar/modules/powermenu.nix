{ config, pkgs, ... }:

let
  toggleWigdet = import ./toggle-widget.nix;

  cmd = toggleWigdet.tw "power";
in
{
  "custom/powermenu" = {
    format = " ";
    tooltip-format = "Powermenu";
    on-click = cmd;
    tooltip = false;
  };
}
