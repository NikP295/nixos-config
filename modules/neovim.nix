{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    neovim
    ripgrep
    fd
    wl-clipboard

  ];

}

