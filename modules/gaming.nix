{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    steam
    wineWowPackages.stagingFull
    winetricks
    protontricks
    protonplus
    vinegar
    prismlauncher
    dosbox
    lutris
    openmw

  ];
  
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true; 
    
  };

  boot.blacklistedKernelModules = [ "xpad" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.xone ];
  boot.kernelModules = [ "xone-dongle" ];

  boot.kernelParams = [ "usbcore.autosuspend=-1" ];

  # iso mounting
  programs.cdemu.enable = true;

}
