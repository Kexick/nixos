{
  description = "Main flake";

  inputs = {

    nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
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
    # hyprland.url = "github:hyprwm/Hyprland/v0.49.0";
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # hyprspace = {
    #   url = "github:KZDKM/Hyprspace";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # quickshell = {
    #   url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      self,
      home-manager,
      # hyprspace,
      nixpkgs,
      nvf,
      # hyprland,
      # hyprland-plugins,
      # quickshell,
      zen,
      ...
    }:
    let
      system = "x86_64-linux";
      # hyprland-pkgs = hyprland.packages.${system};
    in
    {

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./autoimport.nix
          # {
          #   nixpkgs.overlays = [
          #     (final: prev: {
          #       hyprland = hyprland-pkgs.hyprland;
          #     })
          #   ];
          # }
        ];
        specialArgs = {
          inherit
            zen
            # hyprland-plugins
            # hyprspace
            # quickshell
            ;
        };
      };
      homeConfigurations.kexick = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./home-manager/home.nix
          nvf.homeManagerModules.default
        ];
      };
    };
}
