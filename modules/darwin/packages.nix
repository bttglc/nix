{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  age # File encryption tool
  age-plugin-yubikey # YubiKey plugin for age
  
  bat # Cat clone with syntax highlighting
 
  eza # Icons for files

  fd # Fast find alternative
  ferium # CLI Minecraft mod manager
  ffmpeg # Multimedia framework
  fish # Scriptable shell
  fzf # Fuzzy finder

  git # Version control software
  graphicsmagick # Image manipulation framework

  htop # Interactive process viewer
  
  iftop # Network bandwidth monitor

  jq # JSON processor

  neofetch # System information tool
  neovim # Editor

  pandoc # Document converter
  pakku # Minecraft modpack manager

  ripgrep # Fast text search tool
  rsync # Sync

  termusic # Music player in the terminal
  tmux # Terminal multiplexer
  tree # Directory tree viewer 
  typst # LaTeX alternative 

  wget # File downloader
  
  xz # Archive utility
  ];
}
