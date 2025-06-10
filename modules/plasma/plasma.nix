{ config, pkgs, ... }:

{

  # SDDM (login manager)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # <--- enable Wayland support for SDDM
    theme = "breeze";

    settings = {
      General = {
        Background = "/etc/sddm_background.png";
      };
    };

  };

  environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background=/etc/sddm_background.png
    '')
     
      pkgs.kdePackages.plasma-browser-integration
      pkgs.kdePackages.yakuake
      pkgs.kdePackages.plasma-vault    
      pkgs.kdePackages.partitionmanager
      pkgs.kdePackages.ktorrent
  ];

  #environment.etc."sddm_background.png".source = /home/nick/Pictures/backgrounds/cyberpunk_city.png;


  
  # Plasma 6
  services.desktopManager.plasma6.enable = true;
  #programs.klipper.enable = true;    # this auto-starts Klipper

  # Keyboard layout
  services.xserver.xkb = {
    layout = "si";
    variant = "";
  };

  # Optional: Touchpad
  # services.xserver.libinput.enable = true;

  # Sound with PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Restart SDDM if it crashes after sleep
  systemd.services.sddm.serviceConfig.Restart = "always";

  # Suspend key handling (optional but good)
  services.logind.extraConfig = ''
    HandleSuspendKey=suspend
    HandleLidSwitch=suspend
    HandleLidSwitchDocked=ignore
  '';
}

