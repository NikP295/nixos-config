{ config, pkgs, lib, ... }:

{
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  hardware.firmware = with pkgs; [
    linux-firmware
  ];

  boot.kernelModules = [ "rtw89pci" ];

  boot.extraModulePackages = [
    pkgs.rtw89
  ];
}
