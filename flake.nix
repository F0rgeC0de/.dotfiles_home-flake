{
  description = "My user environment with dev setup and basic utilities";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # use "aarch64-darwin" for Apple Silicon Macs
      pkgs = import nixpkgs {
        system = system;
        config = { allowUnfree = true; }; # for some fonts or lazygit
      };
    in {
      homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/home.nix ];
        username = "colin";
        homeDirectory = "/home/colin";
      };
    };
}
