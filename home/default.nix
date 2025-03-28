{
  nixpkgs,
  home-manager,
  stylix,
  ...
} @ inputs: {
  "liuwilli@ivory" = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    extraSpecialArgs = {inherit inputs;};
    modules = [
      stylix.homeManagerModules.stylix
      ./liuwilli-at-ivory
    ];
  };
}
