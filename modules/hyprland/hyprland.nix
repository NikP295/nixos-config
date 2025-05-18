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
      pkgs.hyprland
      pkgs.hyprpaper
      pkgs.cliphist



  ];

  programs.xwayland.enable = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "si";
    variant = "";
  };

  # Optional: Touchpad

  # Sound with PipeWire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Restart SDDM if it crashes after sleep
  systemd.services.sddm.serviceConfig.Restart = "always";

}

