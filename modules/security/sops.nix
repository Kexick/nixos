{...}: let
  xray-common = {
    sopsFile = ../../secrets/xray.yaml;
    owner = "root";
    group = "root";
    mode = "0400";
  };
in {
  sops = {
    validateSopsFiles = true;
    age.keyFile = "/var/lib/sops-nix/key.txt";
    secrets = {
      "xray/id" = xray-common;
      "xray/shortId" = xray-common;
      "xray/mldsa65Verify" = xray-common;
      "xray/spiderX" = xray-common;
      "xray/encryption" = xray-common;
      "xray/address" = xray-common;
      "env/custom_api_key" = {
        sopsFile = ../../secrets/env.yaml;
        owner = "kexick";
        group = "users";
        mode = "0400";
      };
      "user/password_hash" = {
        sopsFile = ../../secrets/env.yaml;
        owner = "root";
        group = "root";
        mode = "0400";
      };
    };
  };
}
