{
  description = "Main flake setup";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    # went to 25.05
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {

      nixos-thinkchad = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; dotfiles = ./dotfiles; };
        system = "x86_64-linux";
        modules = [
          ./modules/home-import.nix
          home-manager.nixosModules.home-manager
          ./hosts/thinkchad.nix
        ];
      };

      nixos-legion = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; dotfiles = ./dotfiles; };
        system = "x86_64-linux";
        modules = [
          ./modules/home-import.nix
          home-manager.nixosModules.home-manager
          ./hosts/legion.nix
        ];
      };

      nixos-thinkold = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; dotfiles = ./dotfiles; };
        system = "x86_64-linux";
        modules = [
          ./modules/home-import.nix
          home-manager.nixosModules.home-manager
          ./hosts/thinkold.nix
        ];
      };


      hardware.enableAllFirmware = true;
    };
  };
}
