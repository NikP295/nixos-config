{ config, pkgs, ... }:

{
  programs.hyprland.enable = true; # enable Hyprland
  

  environment.systemPackages = with pkgs; [
    # ... other packages
    kitty # required for the default Hyprland config
    
    hyprpaper
    hypridle
    hyprlock
    hyprnotify
    
    wl-clipboard
    grim
    slurp
    brightnessctl
    wlr-randr
    playerctl
    pamixer
    networkmanagerapplet
    pavucontrol
    gnome-keyring
    kdePackages.polkit-kde-agent-1
    pkgs.kdePackages.konsole
    xdg-desktop-portal
    pkgs.xdg-desktop-portal-hyprland
    quickshell
    wofi
    mako

  ];

  programs.dconf.enable = true;

  services.gnome.gnome-keyring.enable = true;

}

