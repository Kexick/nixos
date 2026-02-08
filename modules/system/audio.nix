{pkgs, ...}: {
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
      wireplumber.extraConfig = {
        disableRestore = {
          "wireplumber.settings" = {
            "device.restore" = "false";
            "stream.restore" = "false";
          };
        };
      };
      configPackages = [
        (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/override.conf" ''
          context.properties = {
          	default.clock.rate        = 48000
          	default.clock.min-quantum = 32
          	default.clock.quantum     = 100
          	default.clock.max-quantum = 2048

          	}
        '')
      ];
    };
  };
}
