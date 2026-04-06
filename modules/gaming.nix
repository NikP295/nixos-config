{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    steam
    wineWowPackages.stagingFull
    winetricks
    protontricks
    vinegar
    prismlauncher
    dosbox
    lutris
    openmw
    daggerfall-unity

  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true; 
    
  };

}
