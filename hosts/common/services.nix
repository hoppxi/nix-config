{
  services = {
    upower.enable = true;
    sshd.enable = true;
    timesyncd.enable = true;
    dbus.enable = true;
    udisks2.enable = true;

    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "no";
      };

      openFirewall = true;
    };
  };
}
