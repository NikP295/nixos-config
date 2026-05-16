{ config, pkgs, ... }:

{
  imports = [
    ./hyprland_common.nix
  ];

  programs.hyprland =  {
    settings = {
      "monitor" = ",1920x1080@60,auto,auto";
    };
  };
}

