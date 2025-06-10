# modules/state-version.nix
{ config, lib, ... }:

{
  # Set the stateVersion here.
  config.system.stateVersion = "25.05";
  
  # Auto upgrades (updates)
  config.system.autoUpgrade.enable = true;
  config.system.autoUpgrade.dates = "weekly";

  # Cleanup
  config.nix.gc.automatic = true;
  config.nix.gc.dates = "daily";
  config.nix.gc.options = "--delete-older-than 10d";
  config.nix.settings.auto-optimise-store = true;
}

