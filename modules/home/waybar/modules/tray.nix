{ config, pkgs, ... }: 

{
  tray = {
    icon-size = 18;
    spacing = 10;
    margin = 5;
    orientation = "horizontal";
    show-passive-items = true;
    show-hidden-items = false;
    tooltip = true;            
    gtk-layer-shell = true;
    halign = "right";
    valign = "center";
    background = false;
    monitored-apps = [
      "vesktop"
      "telegram"
    ];
  };
}
