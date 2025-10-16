{ lib, ... }:
{
	networking = {
		hostName              = "nixos"; # Define your hostname.
		networkmanager.enable = true;  # Easiest to use and most distros use this by default.
		nameservers           = [ "1.1.1.1" "8.8.8.8" "0.0.0.0"];
        useDHCP = lib.mkDefault true;
	};
		# Configure network proxy if necessary
		# networking.proxy.default = "http://user:password@proxy:port/";
		# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
