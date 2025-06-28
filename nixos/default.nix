{inputs, ...}: {
  flake.nixosConfigurations = {
    ivory = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
        inputs.stylix.nixosModules.stylix
        inputs.nvf.nixosModules.nvf
        ../mixed/ivory
        ./ivory
      ];
    };
  };
}
