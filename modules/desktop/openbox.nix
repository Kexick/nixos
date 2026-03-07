{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    openbox
    openbox-menu
    obconf
  ];
}
