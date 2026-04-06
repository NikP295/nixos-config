{ config, pkgs, ... }:

{
  imports = [
    ../hardware/desktop-hw.nix
    ../modules/system-settings.nix

    ../modules/common.nix
    ../modules/plasma/plasma.nix
    ../modules/hyprland/hyprland.nix
    ../modules/virtualization.nix

    ../modules/gaming.nix
    ../modules/programming.nix
    ../modules/CS.nix
    ../modules/neovim.nix
    ../modules/internet_apps.nix

    ../modules/misc_programs.nix
    ../modules/complex_audio.nix
    ../modules/office.nix
  ];

  nixpkgs.config.allowUnfree = true;
  
  # gaming with wife
  services.flatpak.enable = true;

  networking.hostName = "nixos-desktop";
  networking.firewall.enable = true;

  boot.kernelModules = [ "amdgpu" ];
  hardware.cpu.intel.updateMicrocode = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ mesa ];
  };

  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-tools # Run `vulkaninfo` to confirm driver
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  fileSystems."/mnt/SATA_ssd" = {
   device = "/dev/disk/by-uuid/78c6a50a-385f-44bd-86e8-2f7b29955b7a";
   fsType = "ext4";
   options = [ # If you don't have this options attribute, it'll default to "defaults" 
     # boot options for fstab. Search up fstab mount options you can use
     "users" # Allows any user to mount and unmount
     "nofail" # Prevent system from failing if this drive doesn't mount
     
   ];
  };
}
