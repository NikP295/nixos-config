{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # audio/video
    vlc
    easyeffects
    qpwgraph

    # hardware input device management
    polychromatic
    openrazer-daemon
    vial

    # misc
    fzf
    sl
    viber
    calibre
    gimp
    klavaro
    unrar
    kdePackages.yakuake
    astroterm

  ];

  hardware.openrazer.enable = true;

  services.dbus.packages = [ pkgs.libsForQt5.kglobalaccel ];  # for yakuake
  
  users.users.nick = { extraGroups = [ "openrazer" ]; };

}
