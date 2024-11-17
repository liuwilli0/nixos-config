{
  description = "liuwilli's NixOS flake";

  outputs = {
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
        ./parts/auxilary.nix
        ./parts/home-configs.nix
        ./parts/nixos-configs.nix

        ./nixos/configurations
        ./home/configurations
      ];
      
      flake = {
        lib = import ./lib { inherit inputs; };
      };
    };

  inputs = {
    arkenfox = {
      url = "https://github.com/arkenfox/user.js/raw/master/user.js";
      flake = false;
    };

    call-flake = {
      url = "github:divnix/call-flake/19f405073d0e8d8027aa9331d0a7fcb0b42d8124";
      flake = false;
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };
}
