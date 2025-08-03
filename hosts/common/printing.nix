{ config, pkgs, ... }:

{
  services.printing = {
    enable = true;

    drivers = with pkgs; [
      gutenprint
      hplip
    ];

    Browse = true;
    listenAddresses = [ "*:631" ];
    allowFrom = [ "all" ];
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  users.users.${config.networking.hostName}.extraGroups = [
    "lp"
    "lpadmin"
  ];
}
