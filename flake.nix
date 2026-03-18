{
  description = "Main flake";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    minegrub-world-sel-theme = {
      url = "github:Lxtharia/minegrub-world-sel-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mcp-hub.url = "github:ravitemer/mcp-hub";

    hyprland.url = "github:hyprwm/Hyprland/v0.54.0";
  };

  outputs = inputs @ {
    home-manager,
    nixpkgs,
    nvf,
    hyprland,
    zen,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    lib = pkgs.lib;
    moduleLib = import ./autoimport.nix {inherit lib;};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/desktop
        inputs.minegrub-world-sel-theme.nixosModules.default
        hyprland.nixosModules.default
      ];
      specialArgs = {
        inherit
          moduleLib
          inputs
          ;
      };
    };

    homeConfigurations.kexick = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./home/home.nix
        nvf.homeManagerModules.default
      ];
    };
  };
}
