{ config, pkgs, ... }:

{
  system.defaults.dock.persistent-apps = [
    "${pkgs.alacritty}/Applications/Alacritty.app"
    "${pkgs.firefox}/Applications/Firefox.app"
    "/Applications/Minecraft.app" 
    "/Applications/Bitwarden.app"
    "/Applications/Hammerspoon.app/"
    "/System/Applications/System\ Settings.app"
  ];
}
