{
  self,
  inputs,
  config,
  lib,
  ...
}: let
  cfg = config.liuwilli.nixosConfigurations;

  configs = builtins.mapAttrs (_: config: config.finalSystem) cfg;
in {
  options = {
    liuwilli.nixosConfigurations = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule ({
        name,
        config,
        ...
      }: {
        options = {
          nixpkgs = lib.mkOption {
            type = lib.types.unspecified;
            default = inputs.nixpkgs;
          };

          system = lib.mkOption {
            type = lib.types.enum [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
          };

          entryPoint = lib.mkOption {
            type = lib.types.unspecified;
            readOnly = true;
          };

          finalModules = lib.mkOption {
            type = lib.types.listOf lib.types.unspecified;
            readOnly = true;
          };

          finalSystem = lib.mkOption {
            type = lib.types.unspecified;
            readOnly = true;
          };
        };

        config = {
          entryPoint = "${self}/nixos/configurations/${name}";

          finalModules = [ config.entryPoint ];

          finalSystem = config.nixpkgs.lib.nixosSystem {
            modules = config.finalModules;
          };
        };
      }));
    };
  };

  config.flake.nixosConfigurations = configs;
}
