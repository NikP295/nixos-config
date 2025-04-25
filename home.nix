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

  home.file.".local/share/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defaults".source = ./dotfiles/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defualts;

  home.file.".local/share/plasma/look-and-feel/org.kde.breezedark.desktop/contents/layouts/org.kde.plasma.desktop-layout.js".source = ./dotfiles/plasma/look-and-feel/org.kde.breezedark.desktop/contents/layouts/org.kde.plasma.desktop-layout.js;
  home.file.".local/share/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defaults".source = ./dotfiles/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defualts;
  home.file.".local/share/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defaults".source = ./dotfiles/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defualts;

  home.stateVersion = "24.11";
}

