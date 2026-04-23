{...}: {
  environment.variables = {
    NVD_BACKEND = "direct";
  };
  security.chromiumSuidSandbox.enable = true;
}
