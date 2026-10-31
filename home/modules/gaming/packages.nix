{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
    heroic
    osu-lazer-bin
    lutris
    jdk25

    vulkan-extension-layer
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
  ];
}
