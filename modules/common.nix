{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # basic stuff 
    vim
    zsh
    oh-my-zsh
    neofetch
    home-manager
    git
    htop
    p7zip
    exfat
    gptfdisk
    lshw
    usbutils
  ];

  systemd.services.gitanje-pull = {
    description = "Gitanje pull newest nixos config";

    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];

    path = [ pkgs.git ];

    serviceConfig = {
      Type = "oneshot";
      User = "nick";
      WorkingDirectory = "/etc/nixos/";
      ExecStart = "/etc/nixos/git_management/gitanje pull";
      StandardOutput = "journal";
      StandardError = "journal";
      Restart = "on-failure";
      RestartSec = "10s";   wants = [ "network-online.target" ];
    };
  };

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
    extraGroups = [ "networkmanager" "wheel" "dialout" "nick" "input" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
    shell = pkgs.zsh;
  };

  hardware.uinput.enable = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.activationScripts.fixEtcNixosOwnership.text = ''
    chown -R nick:nick /etc/nixos
    chown -R nick:nick /dev/uinput
  '';
  
  programs.zsh = {
  enable = true;
  ohMyZsh = {
    enable = true;
    theme = "fino"; # Or "robbyrussell", "bira", etc.
    plugins = [ "git" "z" "sudo" ];
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  boot.loader.systemd-boot.enable = true; 
  boot.loader.efi.canTouchEfiVariables = true;
}
