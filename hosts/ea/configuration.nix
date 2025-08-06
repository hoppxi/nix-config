{ pkgs, ... }:

{

  # Nix settings
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
  system.stateVersion = "24.05";
}
