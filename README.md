# My MacBook Nix configuration

---

## 🚨 Migration Guides Available!

Looking to move away from nix-darwin? Check out these guides:

- **[MIGRATION_GUIDE.md](MIGRATION_GUIDE.md)** - Complete migration from nix-darwin to native macOS
- **[CLEAN_SYSTEM_STRATEGY.md](CLEAN_SYSTEM_STRATEGY.md)** - Keep your system clean and maintainable
- **[GUARDRAILS.md](GUARDRAILS.md)** - Automated prevention of bloatware and bad habits

### Quick Setup (Guardrails Only)

```bash
./setup-guardrails.sh  # Install package management protections
source ~/.zshrc         # Reload shell
pkg-add <package>       # Use this instead of 'brew install'
```

See [GUARDRAILS.md](GUARDRAILS.md) for full details.

---

## Current nix-darwin Setup

```
.
├── README.md 
├── darwin                     # system configurations
│   ├── default.nix            
│   ├── brew.nix               # casks and packages handled via homebrew
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
│       ├── default.nix        # also includes all pkgs that don't have a default option
│       ├── eza.nix            # modern ls replacement
│       ├── firefox.nix        # hardening and cosmetic policies
│       ├── git.nix            # user specific git configuration
│       ├── neovim.nix         # default editor setup
│       ├── vscodium.nix       # telemetry free IDE based on VSCode repo
│       └── zsh.nix            # default shell setup
└── secrets                    # TODO

```
