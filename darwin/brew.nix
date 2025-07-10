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

      # Password manager
      "bitwarden"

      # Wine-based software to execute Windows programs
      "crossover"  

      # VoIP client
      "discord"

      # Text expansion utility
      "espanso"

      # Powerful automation tool
      "hammerspoon"

      # Cube-based game focusing on mining and crafting
      "minecraft"
      
      # Gaming client and store
      "steam"

      # OCR navigation
      "superkey"

      # Window and tiling manager
      "rectangle"

      # Torrent client
      "transmission"

      # A focused browser based on Firefox
      "zen"
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
