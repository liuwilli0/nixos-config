{
  self,
  inputs,
  config,
  lib,
  ...
}: let
  cfg = config.liuwilli.homeConfigurations;

  enabledCfgs = lib.filterAttrs (_: config: config.enable) cfg;

  configs = builtins.mapAttrs (_: config: config.finalHome) enabledCfgs;
in {
  options = {
    liuwilli.homeConfigurations = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule ({
        name,
        config,
        ...
      }: {
        options = {
          enable = lib.mkEnableOption "Enable this home configuration." // {default = true;};

          nixpkgs = lib.mkOption {
            type = lib.types.unspecified;
            default = inputs.nixpkgs;
          };

          system = lib.mkOption {
            type = lib.types.enum [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
          };

          username = lib.mkOption {
            type = lib.types.str;
            default = builtins.elemAt (lib.strings.split "@" name) 0;
          };

          hostname = lib.mkOption {
            type = lib.types.str;
            default = builtins.elemAt (lib.strings.split "@" name) 2;
          };

          home-manager = lib.mkOption {
            type = lib.types.unspecified;
            readOnly = true;
          };

          entryPoint = lib.mkOption {
            type = lib.types.unspecified;
            readOnly = true;
          };

          homeDirectory = lib.mkOption {
            type = lib.types.str;
            readOnly = true;
          };

          finalModules = lib.mkOption {
            type = lib.types.listOf lib.types.unspecified;
            readOnly = true;
          };

          finalHome = lib.mkOption {
            type = lib.types.unspecified;
            readOnly = true;
          };
        };

        config = lib.mkIf config.enable {
          entryPoint = "${self}/home/configurations/${config.username}@${config.hostname}";
          homeDirectory = "/home/${config.username}";

          finalModules = [ config.entryPoint { home = { inherit (config) username homeDirectory; }; } ];

          finalHome = config.home-manager.lib.homeManagerConfiguration {
            pkgs = config.nixpkgs.legacyPackages.${config.system};

            modules = config.finalModules;

            extraSpecialArgs = { inherit inputs; };
          };

          home-manager = self.lib.patchFlake {
            pkgs = config.nixpkgs.legacyPackages.${config.system};

            name = "home-manager-patched";
            src = inputs.home-manager;

            patches = [
              "${self}/patches/home-manager-firefox.patch"
            ];

            lockFileEntries = {
              nixpkgs.locked = {
                type = "path";
                path = config.nixpkgs.outPath;
                inherit (config.nixpkgs.sourceInfo) narHash;
              };
            };
          };
        };
      }));
    };
  };

  config.flake.homeConfigurations = configs;
}
