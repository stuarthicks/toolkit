{
  inputs = {
    nixpkgs.follows = "cargo2nix/nixpkgs";
    flake-utils.follows = "cargo2nix/flake-utils";
    cargo2nix.url = "github:cargo2nix/cargo2nix/release-0.11.0";
  };

  outputs = inputs:
    with inputs;
      flake-utils.lib.eachDefaultSystem (
        system: let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [cargo2nix.overlays.default];
          };

          rustPkgs = pkgs.rustBuilder.makePackageSet {
            rustVersion = "1.61.0";
            packageFun = import ./Cargo.nix;
          };
        in rec {
          packages = {
            toolkit = (rustPkgs.workspace.toolkit {}).bin;
            default = packages.toolkit;
          };
        }
      );
}
