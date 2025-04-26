# modules/state-version.nix
{ config, lib, ... }:

{
  # Set the stateVersion here.
  config.system.stateVersion = "24.11";
  
  # Auto upgrades (updates)
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  # Cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;
}

