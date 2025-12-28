{
  pkgs,
  ...
}:

{
  users.users.hoppxi = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "input"
      "bluetooth"
      "plugdev"
      "libvirtd"
      "kvm"
    ];
    shell = pkgs.fish;
    description = "@hoppxi";
  };
}
