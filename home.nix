{ config, pkgs, ... }:

{
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
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

  programs.git = {
    enable = true;
    userName = "NikP295";
    userEmail = "nikposedi295@gmail.com";
    
    extraConfig = {
      safe.directory = "/etc/nixos";
    };

  };

 



  home.stateVersion = "24.11";
}

