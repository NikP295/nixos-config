{ config, pkgs, ... }:

{
  imports = [
    ./hyprland_common.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitor=",1920x1080@144,auto,auto"
  }
}

