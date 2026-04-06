{ config, pkgs, nixpkgs-unstable, ... }:

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
      pkgs.kdePackages.plasma-vault    
      pkgs.kdePackages.partitionmanager
      pkgs.kdePackages.ktorrent
      pkgs.kdePackages.plasma-workspace
      pkgs.kdePackages.qtwayland
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.kdenlive
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
  # added when yakuake was crashing on launch
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    audio.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  # Restart SDDM if it crashes after sleep
  systemd.services.sddm.serviceConfig.Restart = "always";

  environment.variables = {
    KDE_SKIP_INPUT_CAPTURE_WARNING = "1";
  };

}

