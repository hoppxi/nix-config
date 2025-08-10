{ pkgs, ... }:

{
  nix = {
    package = pkgs.nix;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  networking.hostName = "ea";

  nixpkgs.config.allowUnfree = true;

  # fileSystems."/media/hdd" = {
  #   device = "/dev/disk/by-uuid/D6D43101D430E601";
  #   fsType = "ntfs";
  #   options = [
  #     "defaults"
  #     "noatime"
  #   ];
  # };

  # Reinstalled
  system.stateVersion = "25.05";
}
