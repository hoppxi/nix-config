{
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = false;
  virtualisation.kvm.enable = true;

  virtualisation.libvirtd = {
    groups = [ "libvirtd" ];
  };

  networking.firewall.allowedTCPPorts = [
    5900
    16509
  ]; # VNC and libvirt
  networking.firewall.allowedUDPPorts = [ 16509 ]; # libvirt
}
