{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;                    # Enable Zsh shell management through Home Manager
    enableCompletion = true;          # Enable tab completion system
    autosuggestion.enable = true;     # Show gray suggestions based on history as you type
    syntaxHighlighting.enable = true; # Color commands green/red based on validity
    
    # History configuration
    history = {
      size = 10000;                                # Max commands to keep in memory during session
      save = 10000;                                # Max commands to save to history file
      path = "${config.xdg.dataHome}/zsh/history"; # Where to store history file (~/.local/share/zsh/history)
      ignoreDups = true;                           # Don't save duplicate commands consecutively
      ignoreSpace = true;                          # Don't save commands that start with a space
      expireDuplicatesFirst = true;                # When history is full, remove duplicates before unique commands
      extended = true;                             # Save timestamp and duration with each command
    };

    # Aliases - shortcuts for common commands
    shellAliases = {
      # substitute ls with eza, a modern alternative with colors and icons
      "ls" = "${pkgs.eza}/bin/eza";
      "l" = "${pkgs.eza}/bin/eza -lah";
      "ll" = "${pkgs.eza}/bin/eza -l";
      "la" = "${pkgs.eza}/bin/eza -a";
      "lt" = "${pkgs.eza}/bin/eza --tree";
      "lla" = "${pkgs.eza}/bin/eza -la";

      # Git shortcuts - common git commands
      "g" = "git";                       # Just 'g' instead of 'git'
      "ga" = "git add";                  # Stage changes
      "gc" = "git commit";               # Create commit
      "gco" = "git checkout";            # Switch branches/checkout files
      "gd" = "git diff";                 # Show changes
      "gl" = "git log --oneline --graph"; # Pretty git history
      "gp" = "git push";                 # Push to remote
      "gs" = "git status";               # Show repo status
      
      # Safety aliases - prevent accidental overwrites
      "cp" = "cp -i";                    # Ask before overwriting files
      "mv" = "mv -i";                    # Ask before overwriting files
      "rm" = "rm -i";                    # Ask before deleting files
      
      # Nix shortcuts - common Nix commands
      "drw" = "darwin-rebuild switch";    # Rebuild and switch Nix configuration
      "ncg" = "nix-collect-garbage";      # Collect Nix garbage
    };

    # Environment variables - set global variables for the shell session
    sessionVariables = {
      BROWSER = "open";                  # Default browser (macOS open command)
      PAGER = "less";                    # Default pager for man pages, etc.
      LESS = "-R";                       # Make less display colors properly
    };

    # Powerlevel10k setup - nerd theme
    initContent = "source ~/.p10k.zsh";
    plugins = [   
      {                                                                                   
        name = "powerlevel10k";                                                           
        src = pkgs.zsh-powerlevel10k;                                                     
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";                         
      }
    ];

    # Oh My Zsh configuration - framework for managing Zsh configuration
    oh-my-zsh = {
      enable = true;                     # Enable Oh My Zsh
      plugins = [
        "git"                           # Git aliases and prompt info
        "sudo"                          # Press ESC twice to add sudo to command
        "docker"                        # Docker completions and aliases
        "kubectl"                       # Kubernetes completions and aliases
        "terraform"                     # Terraform completions
        "aws"                           # AWS CLI completions
        "macos"                         # macOS specific commands (trash, etc.)
        "brew"                          # Homebrew completions and aliases
        "colorize"                      # Syntax highlighting for various file types
        "colored-man-pages"             # Colorize man pages
        "command-not-found"             # Suggest packages when command not found
        "common-aliases"                # Useful aliases (grep colors, etc.)
        "copyfile"                      # Copy file contents to clipboard
        "copypath"                      # Copy current path to clipboard
        "dirhistory"                    # Navigate directory history with Alt+arrows
        "history"                       # History aliases (h, hsi, etc.)
        "jsontools"                     # JSON formatting and validation
        "web-search"                    # Search web from command line (google, stackoverflow, etc.)
        "z"                             # Jump to frequently used directories
      ];
    };
  };
}
