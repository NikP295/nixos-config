{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    platformio
    python39
    rustc
    cargo
    gcc
    gdb
    clang

  ];

}
