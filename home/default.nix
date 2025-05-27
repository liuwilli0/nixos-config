{
  nixpkgs,
  home-manager,
  nixvim,
  stylix,
  ...
} @ inputs: {
  "liuwilli@ivory" = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    extraSpecialArgs = {inherit inputs;};
    modules = [
      nixvim.homeManagerModules.nixvim
      stylix.homeManagerModules.stylix
      ./liuwilli-at-ivory
    ];
  };
}
