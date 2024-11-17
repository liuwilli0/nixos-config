# https://discourse.nixos.org/t/apply-a-patch-to-an-input-flake/36904
# https://github.com/NixOS/nix/issues/3920
{inputs, ...}: {
  pkgs,
  name,
  src,
  patches,
  lockFileEntries ? {},
  ...
}: let
  lib = inputs.nixpkgs.lib;

  patched =
    (pkgs.applyPatches {
      inherit name src patches;
    })
    .overrideAttrs (old: {
      outputs = [
        "out"
        "narHash"
      ];
      installPhase =
        old.installPhase ++ "\n" ++
        ''
          ${pkgs.nix}/bin/nix \
            --extra-experimental-features nix-command \
            --offline \
            hash path ./ \
            > $narHash
        ''
      ];
    });

  lockFilePath = "${patched.outPath}/flake.lock";

  # https://discourse.nixos.org/t/fromjson-throws-the-string-is-not-allowed-to-refer-to-a-store-path/28391
  lockFileStr = builtins.unsafeDiscardStringContext (builtins.toJSON (
    if builtins.pathExists lockFilePath
    then let
      lockFile = lib.importJSON lockFilePath;
    in {
      inherit (lockFile) root;
      nodes = lockFile.nodes // lockFileEntries;
    }
    else {
      root = "root";
      nodes.root = {};
    }
  ));

  flake = {
    inherit (patched) outPath;
    narhash = builtins.readFile patched.narHash;
  };
in
  import "${inputs.call-flake}/call-flake.nix" lockFileStr flake ""
