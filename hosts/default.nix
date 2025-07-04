{ inputs, pkgs, username, hostname, ... }:

{
  imports = [
    ../profiles/system.nix
  ];

  networking.hostName = hostname;

  time.timeZone = "Africa/Addis_Ababa";

	i18n = {
    defaultLocale = "en_US.UTF-8";  
    supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  };
  console.keyMap = "us";

  # User definition
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}'s nixos";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
  };

  # Nix settings
  nix = {
    package = pkgs.nix;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
