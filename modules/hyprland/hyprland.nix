{ config, pkgs, ... }:

{
  imports = [
    ./celestia.nix
  ];
  programs.hyprland.enable = true; # enable Hyprland
  
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    # ... other packages
    kitty # required for the default Hyprland config
    
    hyprpaper
    hypridle
    hyprlock
    hyprnotify
    hyprshot
    
    wl-clipboard
    grim
    slurp
    brightnessctl
    wlr-randr
    playerctl
    pamixer
    networkmanagerapplet
    pavucontrol
    kdePackages.polkit-kde-agent-1
    pkgs.kdePackages.konsole
    xdg-desktop-portal
    pkgs.xdg-desktop-portal-hyprland
    wofi
    mako

    ashell
    quickshell

  ];

  programs.dconf.enable = true;

  services.gnome.gnome-keyring.enable = true;

}

