{ config, pkgs, ... }:

{
  system.defaults.dock.persistent-apps = [
    "/Applications/Things3.app"
    "${pkgs.alacritty}/Applications/Alacritty.app"
    "${pkgs.firefox}/Applications/Firefox.app"
    "/Applications/Steam.app/"
    "/Applications/Minecraft.app" 
    "/Applications/CrossOver.app/"
    "/Applications/Bitwarden.app"
    "/Applications/Hammerspoon.app/"
    "/System/Applications/System\ Settings.app"
  ];
}
