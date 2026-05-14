{ config, pkgs, ... }:


{

  imports = [
    ../hardware/legion-hw.nix
    ../modules/common.nix
    ../modules/plasma/plasma.nix
    ../modules/programming.nix
    ../modules/system-settings.nix
  ];
  
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "basic-aah";
 

  # Wayland support
  services.xserver.enable = true;
}

