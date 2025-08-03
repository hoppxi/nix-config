{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    gnupg

    # Bluetootj & sound
    pipewire
    wireplumber
    bluez
    bluez-tools
    blueman

    # printing

    # system-config-printer
    # cups-pk-helper

    # virtualization

    # virt-manager
    # qemu
    # libvirt
    # bridge-utils
    # dnsmasq
    # OVMF
    # virt-viewer
  ];

}
