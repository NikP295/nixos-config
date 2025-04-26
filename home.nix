{ config, pkgs, ... }:

{
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    #browsers
    qutebrowser
    brave
    #gaming
    discord
    #misc
    
  ];

  home.file.".zshrc".source = ./dotfiles/.zshrc;
  home.file.".config/neofetch/config.conf".source = ./dotfiles/neofetch.conf;

  home.file."Pictures/backgrounds/".source = ./dotfiles/backgrounds/;

  #home.file.".local/share/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defaults".source = ./dotfiles/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defaults;
  #home.file.".config/kglobalshortcutsrc".source = ./dotfiles/plasma/kglobalshortcutsrc;
  #home.file.".local/share/color-schemes/BreezeDark.colors".source = ./dotfiles/plasma/color-schemes/BreezeDark.colors;


  home.stateVersion = "24.11";
}

