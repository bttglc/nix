{
  homebrew = {
    enable = true;
    
    casks = [
      # Battery utility
      "aldente"

      # Password manager
      "bitwarden"

      # Powerful automation tool
      "hammerspoon"

      # Cube-based game focusing on mining and crafting
      "minecraft"
      
      # Window and tiling manager
      "rectangle"
    ];
   
    onActivation = {
      autoUpdate = true;  # Update Homebrew automatically
      upgrade = true;     # Upgrade content automatically
      cleanup = "zap";    # Delete everything installed that isn't specified in this file
    };
  };
}
