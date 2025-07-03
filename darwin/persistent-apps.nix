{ config, pkgs, ... }:

{
  system.defaults.dock.persistent-apps = [
    "${pkgs.alacritty}/Applications/Alacritty.app"
    "${pkgs.firefox}/Applications/Firefox.app"
    "/System/Applications/System\ Settings.app"
  ];
}
