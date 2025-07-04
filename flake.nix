{
  description = "Hoppix Modular and Flake-Powered NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs pkgs;
          username = "hoppix";
          hostname = "nixos";
        };

        modules = [
          ./hosts/default.nix
          home-manager.nixosModules.home-manager

          {
            nix.settings.experimental-features = [ "nix-command" "flakes" ];
          }
        ];
      };

      homeConfigurations.hoppix = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [
          ./profile/home.nix
        ];
      };

      packages.${system}.default = pkgs.hello;
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
