{
  programs.firefox = {
    enable = true;

    policies = {
      # =========================================
      # PRIVACY & SECURITY PREFERENCES
      # =========================================
      Preferences = {
        # --- Mozilla Shield Studies & Normandy ---
        # Disable Mozilla's data collection studies
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;          # Disable recipe system
        "app.normandy.api_url" = "";             # Clear API endpoint

        # --- Crash Reporting ---
        # Disable automatic crash report submission
        "breakpad.reportURL" = "";

        # --- Browser UI & Behavior ---
        "browser.aboutConfig.showWarning" = false;           # Skip about:config warning
        "browser.discovery.enabled" = false;                # Disable addon discovery
        "browser.contentblocking.category" = "strict";      # Enhanced tracking protection
        "browser.search.suggest.enabled" = false;           # Disable search suggestions
        "browser.startup.homepage" = "about:home";          # Set homepage
        "browser.startup.page" = 1;                         # Start with homepage
        "browser.tabs.crashReporting.sendReport" = false;   # Disable tab crash reports

        # --- Theme Settings ---
        "browser.theme.content-theme" = 0;                  # Dark content theme
        "browser.theme.toolbar-theme" = 0;                  # Dark toolbar theme

        # --- Address Bar (URL Bar) ---
        "browser.urlbar.suggest.searches" = false;                      # No search suggestions
        "browser.urlbar.speculativeConnect.enabled" = false;           # No speculative connections
        "browser.urlbar.quicksuggest.scenario" = "history";            # Only history suggestions
        "browser.urlbar.quicksuggest.enabled" = false;                 # Disable quick suggest
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;    # No non-sponsored suggestions
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;       # No sponsored suggestions

        # --- New Tab Page ---
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;  # Disable activity stream telemetry
        "browser.newtabpage.activity-stream.telemetry" = false;        # Disable new tab telemetry

        # --- Data Reporting ---
        # Completely disable data submission to Mozilla
        "datareporting.policy.dataSubmissionEnabled" = false;

        # --- DOM & Security ---
        "dom.disable_open_during_load" = true;              # Block popups during page load
        "dom.security.https_only_mode" = true;              # Force HTTPS everywhere

        # --- Geolocation ---
        "geo.provider.use_geoclue" = false;                 # Disable geolocation service

        # --- Language ---
        "intl.accept_languages" = "en-US, en";             # Preferred languages

        # --- Network & Performance ---
        "network.http.refer.XOriginPolicy" = 2;            # Strict referrer policy (same origin only)
        "network.http.referer.XOriginTrimmingPolicy" = 2;  # Trim referrer to origin for cross-origin
        "network.prefetch-next" = false;                   # Disable link prefetching
        "network.predictor.enabled" = false;               # Disable network predictor
        "network.http.speculative-parallel-limit" = 0;     # Disable speculative connections

        # --- Extensions & Add-ons ---
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";  # Use dark theme
        "extensions.getAddons.showPane" = false;                          # Hide get addons pane
        "extensions.htmlaboutaddons.recommendations.enabled" = false;     # No addon recommendations
        "extensions.pocket.enabled" = false;                              # Disable Pocket integration
        "extensions.postDownloadThirdPartyPrompt" = false;                # No third-party install prompts

        # --- Privacy & Data Clearing ---
        "privacy.clearOnShutdown.cookies" = true;          # Clear cookies on shutdown
        "privacy.resistFingerprinting" = true;             # Enable fingerprinting resistance
        "privacy.sanitize.sanitizeOnShutdown" = true;      # Sanitize data on shutdown
        "privacy.sanitize.timeSpan" = 0;                   # Clear all history timespan

        # --- Password Management ---
        # Disable built-in password manager (using external: Bitwarden)
        "signon.rememberSignons" = false;                  # Don't save passwords
        "signon.autofillForms" = false;                    # Don't autofill forms
        "signon.formlessCapture.enabled" = false;          # Don't capture formless logins

        # --- Telemetry (Complete Disable) ---
        "toolkit.telemetry.enabled" = false;                        # Master telemetry switch
        "toolkit.telemetry.unified" = false;                        # Unified telemetry
        "toolkit.telemetry.server" = "data:,";                      # Empty telemetry server
        "toolkit.telemetry.archive.enabled" = false;                # Don't archive telemetry
        "toolkit.telemetry.newProfilePing.enabled" = false;         # No new profile ping
        "toolkit.telemetry.shutdownPingSender.enabled" = false;     # No shutdown ping
        "toolkit.telemetry.updatePing.enabled" = false;             # No update ping
        "toolkit.telemetry.bhrPing.enabled" = false;                # No background hang reporter
        "toolkit.telemetry.firstShutdownPing.enabled" = false;      # No first shutdown ping
        "toolkit.telemetry.coverage.opt-out" = true;                # Opt out of coverage
        "toolkit.telemetry.opt-out" = true;                         # Global telemetry opt-out
        "toolkit.coverage.endpoint.base" = "";                       # Empty coverage endpoint
      };

      # =========================================
      # HIGH-LEVEL POLICIES
      # =========================================
      
      # Disable various Firefox account features
      DisableAccounts = true;                    # Disable sync accounts
      DisableFirefoxAccounts = true;             # Disable Firefox accounts completely
      DisableFormHistory = true;                 # Don't save form history
      DisableTelemetry = true;                   # Policy-level telemetry disable

      # --- Homepage & Search ---
      Homepage.StartPage = "https://www.qwant.com/?l=en";    # Privacy-focused search engine
      SearchEngines.Remove = ["Google" "Bing"];              # Remove default search engines
      SearchEngines.Default = "Qwant";                       # Set Qwant as default

      # =========================================
      # EXTENSION MANAGEMENT
      # =========================================
      ExtensionSettings = {
        # How to add more extensions:
        # 1. Install manually in Firefox
        # 2. Go to about:support and find the extension ID
        # 3. install_url format: https://addons.mozilla.org/firefox/downloads/latest/<addon-name>/latest.xpi

        # Firefox Color - Theme manager
	"FirefoxColor@mozilla.com" = {
	  installation_mode = "normal_installed";
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox-color/latest.xpi";
	  private_browsing = true;
	};

        # uBlock Origin - Ad & tracker blocker
        "uBlock0@raymondhill.net" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          private_browsing = true;               # Allow in private browsing
        };

        # Bitwarden - Password manager
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          private_browsing = true;
        };

        # Vimium - Vim-like keyboard navigation
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium/latest.xpi";
          private_browsing = true;
        };

	# Dark Reader - Default everything to dark mode
        "addon@darkreader.org" = {
	  installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
	  private_browsing = true;
	};
      };
    };
  };
}
