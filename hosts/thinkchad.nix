{ config, pkgs, ... }:


{

  imports = [
    ../hardware/thinkchad-hw.nix
    ../modules/common.nix
    ../modules/plasma/plasma.nix
    ../modules/programming.nix
  ];
  
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos-thinkchad";
  networking.firewall.enable = true; 

  boot.kernelModules = [ "amdgpu" ];
 
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  hardware.cpu.amd.updateMicrocode = true;



  # Wayland support
  services.xserver.enable = true;
}

