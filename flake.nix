{
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos-thinkchad = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; dotfiles = ./dotfiles; };
        system = "x86_64-linux";
        modules = [
          ./modules/home-import.nix
          ./hosts/thinkchad.nix
        ];
      };

      nixos-legion = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; dotfiles = ./dotfiles; };
        system = "x86_64-linux";
        modules = [
          ./modules/home-import.nix
          ./hosts/legion.nix
        ];
      };
    };
  };
}
