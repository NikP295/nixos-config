{ config, pkgs, lib, ... }:

{
  options = {};
  config = {
    networking.networkmanager.enable = true;
    networking.wireless.enable = false;

    hardware.firmware = with pkgs; [
      linux-firmware
    ];

    boot.kernelModules = [ "rtw89pci" ];

    boot.extraModulePackages = [
      pkgs.rtl8852ce
    ];
  };
}
