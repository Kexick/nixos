{...}: {
  programs.keepassxc = {
    enable = true;

    settings = {
      General = {
        ConfigVersion = 2;
        AutoSaveAfterEveryChange = true;
        AutoSaveOnExit = true;
        AutoReloadOnChange = true;
        BackupBeforeSave = true;
        BackupFilePathPattern = "/mnt/hdd0/.backups/{DB_FILENAME}.old.kdbx";
      };

      GUI = {
        ApplicationTheme = "light";
        CompactMode = true;
        ShowTrayIcon = false;
        MinimizeToTray = false;
        MinimizeOnClose = false;
        CheckForUpdates = false;
        Language = "system";
        ColorPasswords = true;
      };

      Security = {
        ClearClipboard = true;
        ClearClipboardTimeout = 15;
        LockDatabaseIdle = true;
        LockDatabaseIdleSeconds = 300;
        LockDatabaseScreenLock = true;
        IconDownloadFallback = true;
        NoConfrimMoveEntryRecycleBin = false;
      };

      Browser = {
        Enabled = true;
        UpdateBinaryPath = false;
      };

      SSHAgent = {
        Enabled = false;
      };

      PasswordGenerator = {
        Length = 24;
        LowerCase = true;
        UpperCase = true;
        Numbers = true;
        SpecialChars = true;
      };
    };
  };
}
