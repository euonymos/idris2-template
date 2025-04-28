{
  description = "A simple development environment for Idris 2";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { pkgs, ... }:
        let

          vscodium-idris2 = pkgs.vscode-with-extensions.override {
            vscode = pkgs.vscodium;
            vscodeExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
              {
                name = "idris2-lsp";
                publisher = "bamboo";
                version = "0.7.0";
                sha256 = "sha256-8eLvHKUPBoge50wzOfp5aK/XVJElVzKtil8Yj+PwNUU=";
              }
              {
                name = "Nix";
                publisher = "bbenoist";
                version = "1.0.1";
                sha256 = "sha256-qwxqOGublQeVP2qrLF94ndX/Be9oZOn+ZMCFX1yyoH0=";
              }
              {
                name = "idris-vscode";
                publisher = "meraymond";
                version = "0.0.14";
                sha256 = "sha256-QAzjm+8Z+4TDbM5amh3UEkSmp0n8ZlRHYpUGAewIVXk=";
              }
            ];
          };
        in
        {
          devShells = rec {
            default = pkgs.mkShell {
              buildInputs = [
                pkgs.idris2
                pkgs.idris2Packages.idris2Lsp
                vscodium-idris2
              ];
            };
          };

        };

      flake = {
        templates.default = {
          path = ./template;
          description = "Idris project template";
        };
      };
    };
}