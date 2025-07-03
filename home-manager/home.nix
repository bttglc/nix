{ config, pkgs, ... }: 

{
  home.username = "saturn";
  home.homeDirectory = "/Users/saturn";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  

  programs.git = {
    enable = true;
    userName = "Gianluca Bottiglieri";
    userEmail = "bottiglierigianluca@icloud.com";
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ../modules/home-manager
  ];
}

