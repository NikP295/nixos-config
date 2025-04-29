{ config, pkgs, ... }:

{
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    #browsers
    qutebrowser
    brave
    surf
    #gaming
    discord
    #misc
    widevine-cdm
  ];
  
    nixpkgs.overlays = [
    (final: prev: {
      qutebrowser = prev.qutebrowser.override {
        enableWideVine = true;
      };
    })
  ];


  home.file.".zshrc".source = ./dotfiles/.zshrc;
  home.file.".config/neofetch/config.conf".source = ./dotfiles/neofetch.conf;


  home.stateVersion = "24.11";
}

