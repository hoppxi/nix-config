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
    ];
    shell = pkgs.zsh;
    description = "@hoppxi";
  };
}
