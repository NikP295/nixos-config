{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    #browsers
    qutebrowser
    brave
    tor-browser
    firefox
    #gaming
    discord
    vesktop
    #misc
    widevine-cdm
    freetube
  ];

}
