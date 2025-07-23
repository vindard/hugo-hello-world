{
  description = "My Project Name";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        hugo = pkgs.hugo;
        aje = pkgs.alejandra;

        website = pkgs.stdenv.mkDerivation {
          pname = "my-project-name";
          version = "0.0.0";
          src = self;

          # Avoid default unpack; Hugo reads directly from source
          unpackPhase = "true";

          buildInputs = [hugo];
          buildPhase = "${hugo}/bin/hugo --minify";

          installPhase = ''
            mkdir -p $out
            cp -r public/* $out/
          '';
        };
      in {
        # Expose the Hugo-built site as a package
        packages = {
          website = website;
        };

        # Default package for 'nix build'
        defaultPackage = website;

        # Development shell with Hugo for iterative editing
        devShells = {
          default = pkgs.mkShell {
            buildInputs = [hugo];
          };
        };

        formatter = aje;
      }
    );
}
