{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # nixos = current (legion) hostname, change probably if different idk 
    nixosConfigurations.nixos-legion = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; dotfiles = ./dotfiles; };
      system = "x86_64-linux";
      modules = [
      	#import the like... Main module you want to use (the pc youre on, unless u got the cofig from me... Make one if u did!)
        ./hosts/legion.nix


	# i feel like touching ts (home manager) would result in instant death so double check before u do idk
        home-manager.nixosModules.home-manager

        ({ config, pkgs, ... }: {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  
	  home-manager.backupFileExtension = "hm-backup";

	  home-manager.users.nick = import ./home.nix { inherit pkgs config; };

        })
      ];
    };
  };


}

