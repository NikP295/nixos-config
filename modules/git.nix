{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "NikP295";
    userEmail = "nikposedi295@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.default = "simple";
      core.editor = "vim";
      # Avoids "dubious ownership" errors
      safe.directory = "/etc/nixos";
    };
  };
}

