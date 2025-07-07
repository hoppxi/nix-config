{ config, pkgs, lib, ... }:

let
  quicklinks = {
    browser = { icon = ""; tooltip = "Brave"; cmd = "brave"; };
    github  = { icon = ""; tooltip = "GitHub"; cmd = "xdg-open https://github.com"; };
    youtube = { icon = ""; tooltip = "YouTube"; cmd = "xdg-open https://youtube.com"; };
    editor  = { icon = ""; tooltip = "VSCode"; cmd = "code"; };
  };

  makeLink = attrs: {
    format = attrs.icon;
    tooltip = true;
    tooltip-format = attrs.tooltip;
    on-click = attrs.cmd;
  };

  customWidgets = lib.mapAttrs' (name: data: {
    name = "custom/${name}";
    value = makeLink data;
  }) quicklinks;
  
in {
  "group/quicklinks" = {
    orientation = "horizontal";
    modules = builtins.attrNames quicklinks;
  };
} // customWidgets
