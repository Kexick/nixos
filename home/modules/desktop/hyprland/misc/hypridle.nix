{
  services.hypridle = {
    enable = true;
    settings = {
      gemeral = {
        before_sleep_cmd = ":";
      };
      listener = {
        timeout = 600;
        command = "systemctl suspend";
      };
    };
  };
}
