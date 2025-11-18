{
  homebrew = {
    enable = true;
    
    brews = [
      # CLI utility to get Apple Store ID
      "mas"

      # Node JS
      "node"

      # LLM utility
      "ollama"

      # Java JDK (includes JRE)
      "openjdk"

      # Python environments
      "pyenv"

    ];

    casks = [
      # Battery utility
      "aldente"

      # Budgeting app
      "actual"
      
      # Spaced repetition tool
      "anki"

      # 3D printing software
      "bambu-studio"

      # Password manager
      "bitwarden"

      # Ebook library and utility
      "calibre"
      
      # AI chatbot
      "claude"
      
      # AI in the terminal
      "claude-code"

      # Wine-based software to execute Windows programs
      "crossover"  

      # .NET sdk
      "dotnet-sdk"

      # VoIP client
      "discord"

      # Text expansion utility
      "espanso"

      # Blue light filter
      "flux-app"

      # UI/UX collaboration tool
      "figma"

      # Powerful automation tool
      "hammerspoon"

      # Games launcher for Epic, GOG and Amazon
      "heroic"

      # Web dev shit for course
      "mamp"

      # Screen recording tool
      "obs"

      # Handheld retro emulator
      "openemu"

      # Open VPN for HTB
      "openvpn-connect"

      # Modded Minecraft launcher
      "prismlauncher"

      # Privacy oriented messaging app
      "signal"

      # Music player
      "spotify"

      # Gaming client and store
      "steam"

      # Trackpad gestures for window management
      "swish"

      # Torrent client
      "transmission"
      
      # Network analysis tool
      "wireshark"
    ];

    masApps = 
      {
        # Video player
	      "ElMediaPlayer" = 1044549675;

        # To-do app based on GTD philosophy
        "Things" = 904280696;
	    };
   
    onActivation = {
      autoUpdate = true;  # Update Homebrew automatically
      upgrade = true;     # Upgrade content automatically
      cleanup = "zap";    # Delete everything installed that isn't specified in this file
    };
  };
}
