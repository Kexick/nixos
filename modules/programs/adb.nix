{...}: {
  programs.adb.enable = true;
  users.users.kexick.extraGroups = ["adbusers"];
}
