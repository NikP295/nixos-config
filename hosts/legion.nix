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

  networking.hostName = "nixos-legion";

  # NVIDIA config (Wayland)
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.open = false; # Most laptops still need proprietary driver
  hardware.nvidia.nvidiaSettings = true;

  # Wayland support
  services.xserver.enable = true;
}

