{
  services.hypridle = {
    enable = true;
    settigs = {
      gemeral = {
        before_sleep_cmd = ":";
      };
      listener = {
        timeout = 600;
        command = "systemclt sleep";
      };
    };
  };
}
