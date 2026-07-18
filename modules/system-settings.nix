# modules/state-version.nix
{ config, pkgs, lib, ... }:

{
  config.system.stateVersion = "26.05";
  
  # Auto upgrades (updates)
  config.system.autoUpgrade.enable = true;
  config.system.autoUpgrade.dates = "weekly";

  # Cleanup
  config.nix.gc.automatic = true;
  config.nix.gc.dates = "daily";
  config.nix.gc.options = "--delete-older-than 30d";
  config.nix.settings.auto-optimise-store = true;
  
  # user service that pulls the newest nixos config from github on launch 
  systemd.user.services.gitanje-pull = {
    description = "Gitanje pull newest nixos config";

    wantedBy = [ "default.target" ];
    after = [ "default.target" ];

    #restartIfChanged = false;

    path = with pkgs; [
      git
      openssh
    ];

    serviceConfig = {
      Type = "oneshot";
      User = "nick";
      WorkingDirectory = "/etc/nixos";
      ExecStart = "/etc/nixos/git_management/gitanje pull";

      StandardOutput = "journal";
      StandardError = "journal";

      Restart = "on-failure";
      RestartSec = "30s";

      #RemainAfterExit = true;
    };
  };


}

