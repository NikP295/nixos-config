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
    python312Packages.pip
    python312Packages.setuptools
    pkgs.python3.pkgs.requests




  ];

}
