{ config, pkgs, ... }:

{
  system.defaults.dock.persistent-apps = [
    "/Applications/Things3.app"
    "${pkgs.obsidian}/Applications/Obsidian.app"
    "${pkgs.alacritty}/Applications/Alacritty.app"
    "${pkgs.firefox}/Applications/Firefox.app"
    "/System/Applications/Mail.app"
    "/Applications/Signal.app"
    "/Applications/Discord.app/"
    "/Applications/Steam.app/"
    "/Applications/Prism\ Launcher.app" 
    "/Applications/CrossOver.app/"
    "/Applications/Spotify.app/"
    "/Applications/Bitwarden.app"
    "/Applications/Hammerspoon.app/"
    "/System/Applications/System\ Settings.app"
  ];
}
