{ pkgs, ... }:
{
  powerManagement.cpuFreqGovernor = "schedutil";
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  boot = { 
    
    kernel.sysctl = { 
      "vm.vfs_cache_pressure" = 50; 
      "vm.swappiness" = 10;
    };
  };
}
