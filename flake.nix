{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		flake-parts.url = "github:hercules-ci/flake-parts";
	};

	outputs = { flake-parts, ... } @ inputs:
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

			perSystem = { config, self', inputs', pkgs, system, ... }: {
				devShells.default = with pkgs; mkShell {
					packages = [
                        qmk
                        python3Packages.appdirs
                    ];
				};
			};
		};
}
