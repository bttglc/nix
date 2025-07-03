# My MacBook Nix configuration

```
.
├── README.md 
├── darwin                     # system configurations
│   ├── default.nix            
│   ├── persistent-apps.nix    # apps on the dock
│   └── system-settings.nix    # various system settings focused on hardening and QoL
├── flake.lock                 
├── flake.nix
├── home-manager               
│   └── home.nix
├── modules                    # configurations for both system-wide and home settings
│   ├── darwin
│   │   ├── default.nix        
│   │   ├── fonts.nix          # notably, a nerd font
│   │   └── packages.nix       # basic terminal utilities
│   └── home-manager
│       ├── alacritty.nix      # fast terminal emulator
│       ├── default.nix
│       ├── firefox.nix        # chrome? no thanks!
│       ├── git.nix            # user specific git configuration
│       ├── neovim.nix         # default editor
│       └── zsh.nix            # default shell
└── secrets                    # TODO

```
