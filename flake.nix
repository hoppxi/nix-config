{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-xl = {
      url = "github:passivelemon/nix-xl";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";

    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.ea = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/ea
          home-manager.nixosModules.home-manager
        ];
      };

      homeConfigurations."hoppxi@ea" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home ];
        extraSpecialArgs = { inherit inputs; };
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
