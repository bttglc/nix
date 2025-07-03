{ config, pkgs, ... }:

{
  nix.gc.interval.Day = 7;
  nix.settings.extra-nix-path = "nixpkgs=flake:nixpkgs";

  # Enable touchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    # Global macOS System Settings
    primaryUser = "saturn";

    # Disable annoying startup sound
    startup.chime = false;
    
    defaults = {
	# Enable automatic software updates
    	SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

        # Do not leave margins between windows
        WindowManager.EnableTiledWindowMargins = false;

        # Prevent guest access
        loginwindow.GuestEnabled = false;

	NSGlobalDomain = {
	  # Dark mode
	  AppleInterfaceStyle = "Dark";
	  
	  # Use 24H format
	  AppleICUForce24HourTime = true;

          # Save to disk (not to iCloud) by default
          NSDocumentSaveNewDocumentsToCloud = false;
          
	  # Expand save panel by default
          NSNavPanelExpandedStateForSaveMode = false;
          NSNavPanelExpandedStateForSaveMode2 = false;
          
	  # Expand print panel by default
          PMPrintingExpandedStateForPrint = false;
          PMPrintingExpandedStateForPrint2 = false;
          
	  # Disable automatic capitalization as it’s annoying when typing code
          NSAutomaticCapitalizationEnabled = false;
          
	  # Disable smart dashes as they’re annoying when typing code
          NSAutomaticDashSubstitutionEnabled = false;
          
	  # Disable automatic period substitution as it’s annoying when typing code
          NSAutomaticPeriodSubstitutionEnabled = false;
          
	  # Disable smart quotes as they’re annoying when typing code
          NSAutomaticQuoteSubstitutionEnabled = false;
          
	  # Disable auto-correct
          NSAutomaticSpellingCorrectionEnabled = false;
          
	  # Disable press-and-hold for keys in favor of key repeat
          ApplePressAndHoldEnabled = false;
          
	  # Set a blazingly fast keyboard repeat rate
          KeyRepeat = 2;
          InitialKeyRepeat = 15;
          
	  # Enable subpixel font rendering on non-Apple LCDs
	  AppleFontSmoothing = 2;
          
	  # Finder: show all filename extensions
          AppleShowAllExtensions = true;
        };

        dock = {
          # Automatically hide and show the Dock
          autohide = true;
          
	  # Move Dock to the right
          orientation = "right";
          
	  # Make Dock icons of hidden applications translucent
          showhidden = true;
          
	  # Don’t show recent applications in Dock
          show-recents = false;
          tilesize = 40;
          
	  # Don't animate opening applications from the Dock
          launchanim = false;
         
	  # Change miniature effect to scale down
	  mineffect = "scale";

	  # Speed up Mission Control animations
          expose-animation-duration = 0.1;
          
	  # Don't show Dashboard as a Space
          dashboard-in-overlay = true;
          
	  # Don’t automatically rearrange Spaces based on most recent use
          mru-spaces = false;
          
	  # Remove the auto-hiding Dock delay
          autohide-delay = null;
          
	  # Remove the auto-hiding Dock delay
          autohide-time-modifier = null;
        };

        finder = {
          # Whether to allow quitting of the Finder
          QuitMenuItem = false;
          
	  # Show stuff in my Desktop
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = true;
          ShowMountedServersOnDesktop = true;
          ShowRemovableMediaOnDesktop = true;
          _FXSortFoldersFirst = true;
          
	  # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
          
	  # Display full POSIX path as Finder window title
          _FXShowPosixPathInTitle = true;
          
	  # Disable the warning when changing a file extension
          FXEnableExtensionChangeWarning = false;

	  # Set default view to column
	  FXPreferredViewStyle = "clmv";
        };

        trackpad = {
          Clicking = true;
          TrackpadRightClick = true;
        };
      };
    };
}
