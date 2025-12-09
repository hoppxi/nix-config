{
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };

    dhcpcd.enable = true;
  };

  systemd.network = {
    enable = true;
    networks."40-wlp2s0" = {
      enable = true;
      name = "wlp2s0";
      networkConfig = {
        DHCP = "yes";
        IPv6AcceptRA = "yes";
        LinkLocalAddressing = "no";
      };
      dhcpV6Config = {
        WithoutRA = "solicit";
      };
    };
  };
}
