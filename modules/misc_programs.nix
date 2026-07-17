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
    calibre
    gimp
    klavaro
    unrar

    #kdePackages.yakuake
    astroterm
    gocryptfs
    qalculate-gtk

  ];

  hardware.openrazer.enable = true;

  services.dbus.packages = [ pkgs.libsForQt5.kglobalaccel ];  # for yakuake
  
  users.users.nick = { extraGroups = [ "openrazer" ]; };

}
