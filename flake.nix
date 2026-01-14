{
  description = "rlpr";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      rlpr = pkgs.clangStdenv.mkDerivation {
        name = "rlpr";
        version = "2.06";
        src = ./.;
        patches = [ "config.patch" ];
      };
    in {

    packages.x86_64-linux.default = rlpr;

  };
}
