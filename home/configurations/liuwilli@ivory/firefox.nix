{inputs, ...}: {
  # https://github.com/nix-community/home-manager/issues/5433
  home.file.".mozilla/firefox/profile0/extension-preferences.json".source = ./extension-preferences.json;

  programs.firefox = {
    enable = true;

    profiles."profile0" = {
      id = 0;
      isDefault = true;

      search = {
        default = "DuckDuckGo";
        privateDefault = "DuckDuckGo";
        force = true;
      };

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        bitwarden
        dearrow
      ];

      settings = {
        # Enable userchrome.css
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Enable hightlight all in findbar
        "findbar.highlightAll" = true;

        # Disable quick find
        "accessibility.typeaheadfind.autostart" = false;
        "accessibility.typeaheadfind.manual" = false;

        # Disable quit shortcut
        "browser.quitShortcut.disabled" = true;

        # Hide bookmarks toolbar
        "browser.toolbars.bookmarks.visibility" = "never";

        # Customize ui
        "browser.uiCustomization.state" = builtins.toJSON {
          "placements" = {
            # "widget-overflow-fixed-list" = [];
            # "unified-extensions-area" = [];
            "nav-bar" = [
              "back-button"
              "forward-button"
              "stop-reload-button"
              "urlbar-container"
              "ublock0_raymondhill_net-browser-action"
              "dearrow_ajay_app-browser-action"
              "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
              # "unified-extensions-button"
            ];
            # "toolbar-menubar" = [
            #   "menubar-items"
            # ];
            "TabsToolbar" = [
              "tabbrowser-tabs"
              "new-tab-button"
              "alltabs-button"
            ];
            # "PersonalToolbar" = [];
            # "dirtyAreaCache" = [
            #   "nav-bar"
            #   "toolbar-menubar"
            #   "TabsToolbar"
            # ];
          };
          # "seen" = [
          #   "ublock0_raymondhill_net-browser-action"
          #   "dearrow_ajay_app-browser-action"
          #   "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
          #   "developer-button"
          # ];
          # "dirtyAreaCache" = [
          #   "nav-bar"
          #   "toolbar-menubar"
          #   "TabsToolbar"
          #   "PersonalToolbar"
          # ];
          "currentVersion" = 20;
          # "newElementCount" = 0;
        };

        # 0100: STARTUP
        "browser.startup.page" = 1;
        "browser.startup.homepage" = "about:home";
        "browser.newtabpage.enabled" = true;
        "browser.newtabpage.activity-stream.showWeather" = false; # Not in arkenfox

        # 0400: SAFE BROWSING
        "browser.safebrowsing.downloads.remote.enabled" = true;

        # 0700: DNS / DoH / PROXY / SOCKS
        "network.trr.mode" = 3;

        # 0800: LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORMS
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;

        # 4500: RFP
        "privacy.resistFingerprinting" = false;
        "privacy.resistFingerprinting.letterboxing" = false;
        "webgl.disabled" = false;

        # 5000: OPTIONAL OPSEC
        "signon.rememberSignons" = false;
        "places.history.enabled" = false;

        # 5500: OPTIONAL HARDENING
        "media.eme.enabled" = true;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
      };
      extraConfigEarly = builtins.readFile inputs.arkenfox;
    };
  };
}
