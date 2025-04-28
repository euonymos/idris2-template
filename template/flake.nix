{
  inputs = {
    idris2-template.url = "github:euonymos/idris2-template";
    flake-parts.follows = "idris2-template/flake-parts";
  };

  outputs = { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { inputs', ... }: {
        devShells = inputs'.idris2-template.devShells;
      };
    };
}
