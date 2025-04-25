{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    platformio
    python39
    rustup
    gcc
    gdb
    clang

  ];

}
