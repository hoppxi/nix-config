{ config, pkgs, ... }:

let
  toggleWigdet = import ./toggle-widget.nix;

  cmd = toggleWigdet.tw "calendar";
in
{
  clock = {
    format = "{:%I:%M %p}";
    tooltip-format = "{:%A, %d %B %Y}";
    on-click = cmd;
  };
}
