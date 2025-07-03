{ config, pkgs, home-manager, ... }:

{
  home.packages = with pkgs; [
    # Note taking
      obsidian
    
    # Videogames
      # Minecraft
      ferium  
  ];

  imports = [
    ./alacritty.nix
    ./eza.nix
    ./firefox.nix
    ./git.nix
    ./neovim.nix
    ./zsh.nix
  ];
}
