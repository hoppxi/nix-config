{
  description = "Modular and Flake-Powered NixOS Config";

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
      username = "hoppxi";
      hostname = "nixos";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs username hostname;
        };

        modules = [
          ./hosts/default.nix
          home-manager.nixosModules.home-manager
        ];
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./profile/home.nix
        ];
        extraSpecialArgs = {
          inherit inputs username hostname;
        };
      };

      packages.${system}.default = pkgs.hello;
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
