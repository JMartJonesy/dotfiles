{
  description = "Nixos Config with Secure Boot through lanzaboote";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      # Optional but recommended to limit the size of your system closure
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
    };
  };

  outputs = {
    nixpkgs,
    disko,
    home-manager,
    nixos-hardware,
    lanzaboote,
    nixvim,
    stylix,
    ... }: {
    nixosConfigurations = {
      framework16 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit disko nixos-hardware home-manager lanzaboote stylix nixvim;
        };
        modules = [
          ./hosts/framework16/configuration.nix
          /*home-manager.nixosModules.home-manager
          {
            extraSpecialArgs = {
              inherit nixvim;
            };
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."jmartjonesy".imports = [
                  ./hosts/shared/home-manager/home.nix
              ];
              backupFileExtension = "hm-backup";
            };
          }
          */
        ];
      };
    };
  };
}
