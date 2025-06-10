{ config, pkgs, ... }:

{
  #home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  
  home-manager.backupFileExtension = "hm-backup";

  home-manager.users.nick = import ../home_nick.nix { inherit pkgs config; };
}

