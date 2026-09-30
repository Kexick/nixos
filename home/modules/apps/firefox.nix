{
  pkgs,
  config,
  ...
}: {
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    profiles."default" = {
      id = 0;
      path = config.home.username;

      settings = {
        "app.normandy.first_run" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.chrome.toolbar_tips" = false;
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "browser.download.always_ask_before_handling_new_types" = true;
        "browser.engagement.ctrlTab.has-used" = true;
        "browser.engagement.fxa-toolbar-menu-button.has-used" = true;
        "browser.engagement.sidebar-button.has-used" = true;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.startup.homepage" = "about:home";
        "browser.tabs.loadInBackground" = true;
        "browser.toolbars.bookmarks.showOtherBookmarks" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionPolicyBypassNotification" = false;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.pocket.enabled" = false;
        "font.name.serif.x-cyrillic" = "DejaVu Sans";
        "font.size.variable.x-cyrillic" = 18;
        "layers.acceleration.force-enabled" = true;
        "layout.css.devPixelsPerPx" = "1.2";
        "media.eme.enabled" = true;
        "media.videocontrols.picture-in-picture.enable-when-switching-tabs.enabled" = true;
        "media.videocontrols.picture-in-picture.video-toggle.has-used" = true;
        "media.videocontrols.picture-in-picture.video-toggle.position" = "left";
        "privacy.annotate_channels.strict_list.enabled" = true;
        "privacy.partition.network_state" = true;
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "security.mixed_content.block_display_content" = true;
        "security.tls.version.min" = 3;
        "sidebar.verticalTabs" = true;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "trailhead.firstrun.didSeeAboutWelcome" = false;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
    policies = {
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;
      DisableTelemetry = true;
      DefaultDownloadDirectory = "\${home}/Downloads";
      DontCheckDefaultBrowser = true;
      HardwareAcceleration = false;
      OfferToSaveLogins = false;
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "firefox-compact-dark@mozilla.org" = {
          install_url = moz "{31a4c81b-add0-4ce4-b6e4-b54dcb0f4d1b}";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        # Picture in picture
        "{31a4c81b-add0-4ce4-b6e4-b54dcb0f4d1b}" = {
          install_url = moz "{31a4c81b-add0-4ce4-b6e4-b54dcb0f4d1b}";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "keepassxc-browser@keepassxc.org" = {
          install_url = moz "keepassxc-browser@keepassxc.org";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = moz "jid1-MnnxcxisBPnSXQ@jetpack";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        # Search by image
        "{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}" = {
          install_url = moz "{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "simple-translate@sienori" = {
          install_url = moz "simple-translate@sienori";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "sponsorBlocker@ajay.app" = {
          install_url = moz "sponsorBlocker@ajay.app";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "uBlock0@raymondhill.net" = {
          install_url = moz "uBlock0@raymondhill.net";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        # Youtube nonstop
        "{0d7cafdd-501c-49ca-8ebb-e3341caaa55e}" = {
          install_url = moz "{0d7cafdd-501c-49ca-8ebb-e3341caaa55e}";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
      };
    };
    profiles.default.search = {
      force = true;
      default = "ddg";
      privateDefault = "ddg";

      engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@np"];
        };

        "Nix Options" = {
          urls = [
            {
              template = "https://search.nixos.org/options";
              params = [
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@no"];
        };

        "NixOS Wiki" = {
          urls = [
            {
              template = "https://wiki.nixos.org/w/index.php";
              params = [
                {
                  name = "search";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@nw"];
        };
      };
    };
    languagePacks = ["en-US" "ru"];
    nativeMessagingHosts = with pkgs; [
      keepassxc
    ];
  };
}
