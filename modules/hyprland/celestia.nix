{ config, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.caelestia-shell.packages.x86_64-linux.with-cli
  ];  
}

