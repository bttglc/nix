{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./git.nix
    ./neovim.nix
    ./zsh.nix
  ];
}
