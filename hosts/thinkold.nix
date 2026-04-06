{ config, pkgs, ... }: {

  imports = [
    ../hardware/thinkold-hw.nix
    ../modules/system-settings.nix

    ../modules/common.nix
    ../modules/plasma/plasma.nix
    ../modules/hyprland/hyprland.nix

    ../modules/gaming.nix
    ../modules/internet_apps.nix
    ../modules/programming.nix
    ../modules/CS.nix
    ../modules/neovim.nix
    ../modules/office.nix

    ../modules/misc_programs.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos-thinkold";
  networking.firewall.enable = true;

  environment.systemPackages = with pkgs; [
    mesa
    vulkan-loader
    libvdpau-va-gl
  ];

  # Use Intel graphics by default
  services.xserver.videoDrivers = [ "intel" "modesetting" ];

  # Optional: enable hybrid AMD support for legacy GPU
  boot.kernelModules = [ "radeon" ]; # Use "amdgpu" only if forcing experimental setup

  # If you're using AMD GPU explicitly (not recommended)
  # hardware.opengl.extraPackages = [ pkgs.vaapiVdpau pkgs.libvdpau-va-gl ];

  hardware.cpu.intel.updateMicrocode = true;

  services.xserver.enable = true;

  # Optional: if you want to force AMD GPU usage (not recommended unless you *need* it)
  # environment.variables = {
  #   DRI_PRIME = "1";
  # };

}
