{ config, pkgs, home-manager, ... }:

{
  home.packages = with pkgs; [
    # Note taking
    obsidian
    
    # Videogames
      # Minecraft
      ferium
      #pakku is not working yet?
  ];

  imports = [
    ./alacritty.nix
    ./eza.nix
    ./firefox.nix
    ./git.nix
    ./neovim.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
