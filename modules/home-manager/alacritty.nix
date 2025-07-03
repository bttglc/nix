{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
 
    settings = {
      # Environment variables
      env = {
        TERM = "xterm-256color";
      };

      # Window configuration
      window = {
        # Window dimensions (changes require restart)
        dimensions = {
          columns = 120;
          lines = 30;
        };
        
        # Window decorations
        decorations = "full";  # full, none, transparent, buttonless
        
        # Startup mode
        startup_mode = "Windowed";  # Windowed, Maximized, Fullscreen
        
        # Window title
        title = "Alacritty";
        
        # Allow terminal applications to change Alacritty's title
        dynamic_title = true;
        
        # Window opacity
        opacity = 0.95;
      };

      # Scrolling
      scrolling = {
        # Maximum number of lines in the scrollback buffer
        history = 10000;
        
        # Number of lines the viewport will move for every line scrolled
        multiplier = 3;
      };

      # Font configuration
      font = {
        normal = {
          family = "MesloLGS NF";
          style = "Regular";
        };
        bold = {
          family = "MesloLGS NF";
          style = "Bold";
        };
        italic = {
          family = "MesloLGS NF";
          style = "Italic";
        };
        bold_italic = {
          family = "MesloLGS NF";
          style = "Bold Italic";
        };
        
        # Point size
        size = 14.0;
        
        # Offset is the extra space around each character
        offset = {
          x = 0;
          y = 0;
        };
        
        # Glyph offset determines the locations of the glyphs within their cells
        glyph_offset = {
          x = 0;
          y = 0;
        };
        
        # Use built-in font for box drawing characters
        builtin_box_drawing = true;
      };

      # Tokyo Night Storm color scheme
      colors = {
        # Default colors
        primary = {
          background = "#24283b";
          foreground = "#c0caf5";
        };
        
        # Normal colors
        normal = {
          black   = "#1d202f";
          red     = "#f7768e";
          green   = "#9ece6a";
          yellow  = "#e0af68";
          blue    = "#7aa2f7";
          magenta = "#bb9af7";
          cyan    = "#7dcfff";
          white   = "#a9b1d6";
        };
        
        # Bright colors
        bright = {
          black   = "#414868";
          red     = "#f7768e";
          green   = "#9ece6a";
          yellow  = "#e0af68";
          blue    = "#7aa2f7";
          magenta = "#bb9af7";
          cyan    = "#7dcfff";
          white   = "#c0caf5";
          };
        
        # Indexed colors
        indexed_colors = [
          { index = 16; color = "#ff9e64"; }
          { index = 17; color = "#db4b4b"; }
        ];
      };

      # Bell
      bell = {
        animation = "EaseOutExpo";
        duration = 0;
        color = "#ffffff";
      };

      # Cursor
      cursor = {
        style = {
          shape = "Block";     # Block, Underline, Beam
          blinking = "Off";    # Never, Off, On, Always
        };
        
        vi_mode_style = {
          shape = "Block";
          blinking = "Off";
        };
        
        blink_interval = 750;
        unfocused_hollow = true;
        thickness = 0.15;
      };

      # Shell
      terminal.shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = ["--login"];
      };

      # Key bindings
      keyboard.bindings = [
        # Copy/Paste
        { key = "V"; mods = "Command"; action = "Paste"; }
        { key = "C"; mods = "Command"; action = "Copy"; }
        
        # New window/tab
        { key = "N"; mods = "Command"; action = "SpawnNewInstance"; }
        { key = "T"; mods = "Command"; action = "CreateNewTab"; }
        
        # Switch tabs
        { key = "RBracket"; mods = "Command|Shift"; action = "SelectNextTab"; }
        { key = "LBracket"; mods = "Command|Shift"; action = "SelectPreviousTab"; }
        
        # Font size
        { key = "Plus"; mods = "Command"; action = "IncreaseFontSize"; }
        { key = "Minus"; mods = "Command"; action = "DecreaseFontSize"; }
        { key = "Key0"; mods = "Command"; action = "ResetFontSize"; }
        
        # Fullscreen
        { key = "F"; mods = "Command|Control"; action = "ToggleFullscreen"; }
        
        # Search
        { key = "F"; mods = "Command"; action = "SearchForward"; }
        
        # Vi mode
        { key = "Space"; mods = "Shift|Control"; mode = "~Search"; action = "ToggleViMode"; }
      ];

      # Debug
      debug = {
        render_timer = false;
        persistent_logging = false;
        log_level = "Warn";
        print_events = false;
      };
    };
  };
}
