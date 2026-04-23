{
  pkgs,
  config,
  ...
}: {
  powerManagement.cpuFreqGovernor = "schedutil";
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [zenpower];
    kernel.sysctl = {
      "vm.vfs_cache_pressure" = 50;
      "vm.swappiness" = 10;
      "kernel.unprivileged_userns_clone" = 1;
      "net.ipv4.conf.all.rp_filter" = 2;
      "net.ipv4.conf.default.rp_filter" = 2;
    };
  };
}
