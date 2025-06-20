{ config, pkgs, ... }:


{

  imports = [
    ../hardware/thinkchad-hw.nix
    ../modules/common.nix
    ../modules/plasma/plasma.nix
    ../modules/hyprland/hyprland.nix
    ../modules/programming.nix
    ../modules/system-settings.nix
    ../modules/neovim.nix
    ../modules/CS.nix
    ../modules/virtualization.nix
  ];
 
  environment.systemPackages = with pkgs; [
    mesa
    amdvlk
    vulkan-loader
  ];


  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos-thinkchad";
  networking.firewall.enable = true; 

  boot.kernelModules = [ "amdgpu" ];
 
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  hardware.cpu.amd.updateMicrocode = true;



  # Wayland support
  services.xserver.enable = true;
}
