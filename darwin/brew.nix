{
  homebrew = {
    enable = true;
    
    brews = [
      # Mesh net VPN based on Wireguard
      "tailscale"

      # Text expansion utility
      "espanso"
    ];

    casks = [
      # Battery utility
      "aldente"

      # Password manager
      "bitwarden"

      # Wine-based software to execute Windows programs
      "crossover"

      # Powerful automation tool
      "hammerspoon"

      # Cube-based game focusing on mining and crafting
      "minecraft"
      
      # Gaming client and store
      "steam"

      # Window and tiling manager
      "rectangle"

      # Torrent client
      "transmission"
    ];
   
    onActivation = {
      autoUpdate = true;  # Update Homebrew automatically
      upgrade = true;     # Upgrade content automatically
      cleanup = "zap";    # Delete everything installed that isn't specified in this file
    };
  };
}
