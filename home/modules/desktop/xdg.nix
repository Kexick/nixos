{config, ...}: {
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;

      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Documents/Music";
      pictures = "${config.home.homeDirectory}/Documents/Pictures";
      videos = "${config.home.homeDirectory}/Documents/Videos";
      templates = "${config.home.homeDirectory}/Documents/Templates";
      publicShare = "${config.home.homeDirectory}/Documents/Public";
    };
  };
}
