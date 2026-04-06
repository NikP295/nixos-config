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
    #misc
    widevine-cdm
    freetube
  ];

}
