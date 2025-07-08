{
  description = "Modular and Flake-Powered NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
    
    sddm-sugar-candy-nix.url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
    sddm-sugar-candy-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, sddm-sugar-candy-nix, flake-utils, ... }@inputs:
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
          sddm-sugar-candy-nix.nixosModules.default

          {
            nixpkgs = {
              overlays = [
                sddm-sugar-candy-nix.overlays.default
              ];
            };
          }
        ];
      };

      homeConfigurations."${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./profiles/home.nix
        ];
        extraSpecialArgs = {
          inherit inputs username hostname;
        };
      };

      packages.${system}.default = pkgs.hello;
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
