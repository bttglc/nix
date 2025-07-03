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

    # Shell options - these modify Zsh behavior (setopt is Zsh's way to enable features)
    setopt = [
      "HIST_VERIFY"              # Show command with history expansion before running it
      "HIST_IGNORE_ALL_DUPS"     # Remove older duplicate from history when adding new one
      "HIST_REDUCE_BLANKS"       # Remove extra whitespace from commands before saving
      "HIST_FIND_NO_DUPS"        # Don't show duplicates when searching history
      "SHARE_HISTORY"            # Share history between all Zsh sessions in real-time
      "INC_APPEND_HISTORY"       # Add commands to history immediately, not when shell exits
      "AUTO_CD"                  # Type directory name without 'cd' to change to it
      "GLOB_DOTS"                # Include hidden files (starting with .) in glob patterns
      "CORRECT"                  # Suggest corrections for mistyped commands
      "MENU_COMPLETE"            # Insert first completion match immediately, cycle with TAB
      "AUTO_LIST"                # Show completions list automatically on ambiguous completion
      "AUTO_PARAM_SLASH"         # Add trailing slash when completing directory names
      "COMPLETE_IN_WORD"         # Allow completion in middle of word, not just at end
    ];

    # Completion styling - how tab completion looks and behaves
    completionInit = ''
      # Case insensitive completion - 'Doc' matches 'documents'
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      
      # Colorful completion - use same colors as ls command
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      
      # Menu selection - use arrow keys to navigate completions
      zstyle ':completion:*' menu select
      
      # Group matches and describe - organize completions by type
      zstyle ':completion:*' group-name ""
      zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
      
      # Better kill completion - colorize process list for kill command
      zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
      zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
    '';

    # Aliases - shortcuts for common commands
    shellAliases = {
      # Directory navigation shortcuts
      ".." = "cd ..";                    # Go up one directory
      "..." = "cd ../..";                # Go up two directories  
      "...." = "cd ../../..";            # Go up three directories
      
      # ls variants - different ways to list files
      "l" = "ls -lah";                   # Long format, all files, human readable sizes
      "la" = "ls -lAh";                  # Long format, all except . and .., human readable
      "ll" = "ls -lh";                   # Long format, human readable sizes
      "ls" = "ls --color=auto";          # Always colorize ls output
      
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
    initExtra = "source ~/.p10k.zsh";
    programs.zsh.plugins = [   
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
