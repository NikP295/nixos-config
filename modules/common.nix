{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
   #basic stuff 
    vim
    neovim
    zsh
    oh-my-zsh
    neofetch
    home-manager
   #coding
    platformio
    git
    python39
   #misc
   steam
   wine
  ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Ljubljana";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sl_SI.UTF-8";
    LC_IDENTIFICATION = "sl_SI.UTF-8";
    LC_MEASUREMENT = "sl_SI.UTF-8";
    LC_MONETARY = "sl_SI.UTF-8";
    LC_NAME = "sl_SI.UTF-8";
    LC_NUMERIC = "sl_SI.UTF-8";
    LC_PAPER = "sl_SI.UTF-8";
    LC_TELEPHONE = "sl_SI.UTF-8";
    LC_TIME = "sl_SI.UTF-8";
  };

  console.keyMap = "slovene";

  # User
  users.groups.nick = {};

  users.users.nick = {
    isNormalUser = true;
    description = "Nick";
    extraGroups = [ "networkmanager" "wheel" "nick" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
    shell = pkgs.zsh;
  };

  # Apps
  #programs.firefox.enable = true;
  
  programs.zsh = {
  enable = true;
  ohMyZsh = {
    enable = true;
    theme = "fino"; # Or "robbyrussell", "bira", etc.
    plugins = [ "git" "z" "sudo" ];
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };









  boot.loader.systemd-boot.enable = true; 
  boot.loader.efi.canTouchEfiVariables = true;

}

