{inputs, ...}: {
  flake.homeConfigurations = {
    "liuwilli@ivory" = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        inputs.stylix.homeModules.stylix
        ../mixed/ivory
        ./liuwilli-at-ivory
      ];
    };
  };
}
