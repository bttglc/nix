{
  homebrew = {
    enable = true;
    
    brews = [
      # CLI utility to get Apple Store ID
      "mas"

      # Java JDK (includes JRE)
      "openjdk"

    ];

    casks = [
      # Battery utility
      "aldente"

      # 3D printing software
      "bambu-studio"

      # Password manager
      "bitwarden"

      # Ebook library and utility
      "calibre"
      
      # AI chatbot
      "claude"

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

      # Powerful automation tool
      "hammerspoon"

      # Screen recording tool
      "obs"

      # Handheld retro emulator
      "openemu"

      # Modded Minecraft launcher
      "prismlauncher"

      # Privacy oriented messaging app
      "signal"

      # Music player
      "spotify"

      # Gaming client and store
      "steam"

      # OCR navigation
      "superkey"

      # Trackpad gestures for window management
      "swish"

      # Window and tiling manager
      "rectangle"

      # Torrent client
      "transmission"
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
