{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  services.upower.enable = true;
}
