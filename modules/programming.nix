{ config, pkgs, ... }:

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
    rpi-imager
    php

    # tutorial for wife
    vscodium

    wayland
    libxkbcommon
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    vulkan-loader
  ];

  services.udev.packages = with pkgs; [
    platformio-core.udev
  ];

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    wayland
    libxkbcommon

    xorg.libX11
    xorg.libXcursor
    xorg.libXi

    vulkan-loader
    mesa
  ];
}
