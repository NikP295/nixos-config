{
  description = "Main flake setup";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    # went to 25.05
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: {
    nixosConfigurations = {

      nixos-thinkchad = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; dotfiles = ./dotfiles; };
        system = "x86_64-linux";
        modules = [
          ./hosts/thinkchad.nix
        ];
      };

      nixos-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; dotfiles = ./dotfiles; };
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop.nix
        ];
      };

      nixos-legion = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; dotfiles = ./dotfiles; };
        system = "x86_64-linux";
        modules = [
          ./hosts/legion.nix
        ];
      };

      nixos-thinkold = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; dotfiles = ./dotfiles; };
        system = "x86_64-linux";
        modules = [
          ./hosts/thinkold.nix
        ];
      };


      hardware.enableAllFirmware = true;
    };
  };
}
