{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./eza.nix
    ./firefox.nix
    ./git.nix
    ./neovim.nix
    ./zsh.nix
  ];
}
