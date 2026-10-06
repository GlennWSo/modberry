{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs = {nixpkgs, ...} @ _inputs: {
    nixosConfigurations = {
      modberry = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./configuration.nix
          ./users.nix
          ./networking.nix
        ];
      };
    };
  };
}
