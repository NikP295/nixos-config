{ config, pkgs, ... }:

{
  # SDDM (login manager)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # <--- enable Wayland support for SDDM
  };

  # Plasma 6
  services.desktopManager.plasma6.enable = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "si";
    variant = "";
  };

  # Optional: Touchpad
  # services.xserver.libinput.enable = true;

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

  # Suspend key handling (optional but good)
  services.logind.extraConfig = ''
    HandleSuspendKey=suspend
    HandleLidSwitch=suspend
    HandleLidSwitchDocked=ignore
  '';
}

