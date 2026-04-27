{...}: {
  services.syncthing = {
    enable = true;
    user = "kexick";
    group = "users";
    dataDir = "/home/kexick";
    configDir = "/home/kexick/.local/state/syncthing";

    overrideDevices = true;
    overrideFolders = true;

    guiAddress = "127.0.0.1:8384";

    settings = {
      gui = {
        tls = true;
        user = "Kexick";
        theme = "default";
      };

      options = {
        globalAnnounceEnabled = false;
        localAnnounceEnabled = true;
        relaysEnabled = false;
        natEnabled = false;
        urAccepted = -1;
        startBrowser = false;
      };

      devices = {
        phone = {
          id = "73475AQ-IKN7AHI-GO3B5VW-EB6JOAY-4FQAFNV-OIVKEX6-ATFYMPV-VHGWFAG";
          addresses = ["tcp://192.168.0.143:22000"];
        };
      };

      folders = {
        notes = {
          id = "64rya-xhknw";
          path = "~/obsidian";
          devices = ["phone"];
        };
        music = {
          id = "ogaxr-hkjqo";
          path = "~/music";
          devices = ["phone"];
        };
        Sync = {
          id = "sync-dir";
          path = "~/Sync";
          devices = ["phone"];
        };
      };
    };
  };
}
