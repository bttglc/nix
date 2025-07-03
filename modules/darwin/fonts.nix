{ config, pkgs, ... }:

{
  # Enable font directory
  fonts = {
    packages = with pkgs; [
      # Install FiraCode Nerd Font (new syntax)
      nerd-fonts.fira-code
    ];
  };
}
