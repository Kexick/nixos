{ pkgs, config, ... }:
{
  powerManagement.cpuFreqGovernor = "schedutil";
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  boot = { 
    extraModulePackages = with config.boot.kernelPackages; [ zenpower ];
    kernel.sysctl = { 
      "vm.vfs_cache_pressure" = 50; 
      "vm.swappiness" = 10;
    };
  };
}
