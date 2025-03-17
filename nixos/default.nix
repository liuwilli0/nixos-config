{nixpkgs, ...} @ inputs: {
  ivory = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [./ivory];
  };
}
