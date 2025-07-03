{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    mac-app-util.url = "github:hraban/mac-app-util"; # Makes apps findable by Spotlight
  };

  outputs = inputs @ { self, nixpkgs, nix-darwin, home-manager, nix-homebrew, mac-app-util, ... }:
  let
    system = "aarch64-darwin";
    username = "saturn";
  in {
    darwinConfigurations."saturn" = nix-darwin.lib.darwinSystem {
      inherit system;
        
      # You can pass variables to modules if needed
      specialArgs = { inherit system; };

      modules = [
        ./darwin/default.nix
	      ./modules/darwin/default.nix
        mac-app-util.darwinModules.default

	      { 
          # Set host OS  
          nixpkgs.hostPlatform = system;

          # Allow unfree packages like Obsidian, Minecraft, etc
          nixpkgs.config.allowUnfree = true;

          # Enable Flakes + nix-command
          nix.settings.experimental-features = "nix-command flakes";

          system.configurationRevision = self.rev or self.dirtyRev or null;
          system.stateVersion = 6;
        }

	      home-manager.darwinModules.home-manager
	      (
	      { pkgs, config, inputs, ... }:
            {
              # Enabling mac app fix for all users:
              home-manager.sharedModules = [
                mac-app-util.homeManagerModules.default
              ];
            }
	      )
	      {
	        # Define user info explicitly in nix-darwin
          users.users.${username} = {
            name = username;
            home = "/Users/${username}";
          };

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = ./home-manager/home.nix;
        }

        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = username;
          };
        }
      ];
    };
  };
}
