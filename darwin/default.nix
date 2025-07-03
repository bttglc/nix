{ config, pkgs, ... }:

{
  imports = [
    ./system-settings.nix
    ./persistent-apps.nix
  ];
}
