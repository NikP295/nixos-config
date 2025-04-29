{
  description = "Main flake setup";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
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
          ./modules/thinkchad_wifi.nix
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
        hardware.enableAllFirmware = true;
    };
  };
}
