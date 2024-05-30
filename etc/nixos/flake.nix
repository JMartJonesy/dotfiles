{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
#    nixvim = {
#      url = "github:nix-community/nixvim";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.xps = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/xps/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
    nixosConfigurations.mac = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/mac/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
