{ config, pkgs, ...}:

{
  virtualisation.virtualbox.host.enable = true;

  # Also enable extension pack if you need USB 2.0/3.0 etc.
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # Add yourself to the vboxusers group
  users.users.nick.extraGroups = [ "vboxusers" ];
}
