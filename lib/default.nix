{inputs, ...}: {
  patchFlake = import ./patchFlake.nix {inherit inputs;};
}
