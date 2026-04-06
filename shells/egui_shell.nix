{ pkgs ? import <nixpkgs> {} }:

let
  runtimeLibs = with pkgs; [
    wayland
    libxkbcommon

    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr

    mesa
    mesa.drivers
    libGL
    libglvnd
    egl-wayland
  ];
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    rustc
    cargo
  ];

  RUSTFLAGS = "-C link-arg=-Wl,-rpath,${pkgs.lib.makeLibraryPath runtimeLibs}";
}
