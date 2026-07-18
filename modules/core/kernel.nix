{
  pkgs,
  config,
  ...
}: {
  powerManagement.cpuFreqGovernor = "schedutil";
  boot = {
    blacklistedKernelModules = ["k10temp"];
    extraModulePackages = with config.boot.kernelPackages; [zenpower];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["zenpower"];
    kernel.sysctl = {
      "vm.vfs_cache_pressure" = 50;
      "vm.swappiness" = 10;
      "kernel.unprivileged_userns_clone" = 1;
      "net.ipv4.conf.all.rp_filter" = 2;
      "net.ipv4.conf.default.rp_filter" = 2;
    };
  };
}
