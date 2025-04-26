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

  home.file."bruh.txt".source = ./dotfiles/bruhmoment.txt;

  home.file.".local/share/plasma/look-and-feel/org.kde.breezedark.desktop/metadata.json".source = ./dotfiles/plasma/look-and-feel/org.kde.breezedark.desktop/metadata.json;

  home.file.".local/share/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defaults".source = ./dotfiles/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defaults;

  home.file.".local/share/plasma/look-and-feel/org.kde.breezedark.desktop/contents/layouts/org.kde.plasma.desktop-layout.js".source = ./dotfiles/plasma/look-and-feel/org.kde.breezedark.desktop/contents/layouts/org.kde.plasma.desktop-layout.js;

  home.file.".config/kglobalshortcutsrc".source = ./dotfiles/plasma/kglobalshortcutsrc;

  home.file.".local/share/color-schemes/BreezeDark.colors".source = ./dotfiles/plasma/color-schemes/BreezeDark.colors;
  home.file.".local/share/color-schemes/BreezeClassic.colors".source = ./dotfiles/plasma/color-schemes/BreezeClassic.colors;
  home.file.".local/share/color-schemes/Oxygen.colors".source = ./dotfiles/plasma/color-schemes/Oxygen.colors;
  home.file.".local/share/color-schemes/OxygenCold.colors".source = ./dotfiles/plasma/color-schemes/OxygenCold.colors;


  home.stateVersion = "24.11";
}

