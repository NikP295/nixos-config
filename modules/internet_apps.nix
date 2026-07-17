{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    #browsers
    qutebrowser
    brave
    tor-browser
    firefox
    #communication
    discord
    vesktop
    viber
    signal-desktop
    signal-cli
    #misc
    widevine-cdm
    freetube
  ];

}
