{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    platformio
    python314
    rustc
    cargo
    gcc
    gdb
    clang

  ];

}
