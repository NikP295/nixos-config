{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    sherlock
    python312Packages.socid-extractor


  ];

}
