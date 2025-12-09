{ pkgs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        package = pkgs.qemu_full;
      };
    };
    spiceUSBRedirection.enable = true;
  };

  users.groups = {
    libvirtd.members = [ "hoppxi" ];
    kvm.members = [ "hoppxi" ];
  };

  services.spice-vdagentd.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    dnsmasq
    phodav
    spice-gtk
  ];
}
