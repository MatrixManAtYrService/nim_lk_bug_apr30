{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      packages = {
        hello = (with pkgs; import ./hello/hello.nix { inherit buildNimPackage; });
      };

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [ nim2 nimble nixpkgs-fmt nim_lk ];
      };

    });
}
