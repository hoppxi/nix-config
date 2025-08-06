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
    ];
    shell = pkgs.zsh;
    description = "@hoppxi";
  };
}
