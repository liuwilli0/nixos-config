{nixpkgs, home-manager, ...} @ inputs: {
  "liuwilli@ivory" = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    extraSpecialArgs = {inherit inputs;};
    modules = [./liuwilli-at-ivory];
  };
}
