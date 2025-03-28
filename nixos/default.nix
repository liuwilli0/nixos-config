{
  nixpkgs,
  nixos-hardware,
  stylix,
  ...
} @ inputs: {
  ivory = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [
      nixos-hardware.nixosModules.lenovo-thinkpad-t480s
      stylix.nixosModules.stylix
      ./ivory
    ];
  };
}
