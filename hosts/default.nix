{ config, pkgs, ... }:


{

  imports = [
    ../hardware/legion-hw.nix
    ../modules/common.nix
    ../modules/plasma/plasma.nix
    ../modules/programming.nix
    ../modules/state-version.nix
  ];
  
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "basic-aah";
 

  # Wayland support
  services.xserver.enable = true;
}

