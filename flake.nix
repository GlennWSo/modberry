{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = ["http://nix.sondell.org"];
    extra-trusted-public-keys = ["nix.sondell.org-1:Qgy0jITf2Ny70N71itHhXTLHWtmTk9ckQAbBAkmkMrQ="];
  };
  outputs = {
    nixpkgs,
    nixos-hardware,
    flake-utils,
    ...
  } @ _inputs: let
    systems = ["x86_64-linux" "aarch64-linux"];
    pkgsOutputs = flake-utils.lib.eachSystem systems (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          rpiboot
          usbutils
          bmaptool
        ];
      };
    });
  in
    {
      nixosConfigurations = {
        modberry = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            ./configuration.nix
            ./users.nix
            ./networking.nix
            ./modberry.nix
            ./sdimg.nix
            nixos-hardware.nixosModules.raspberry-pi-4
            "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          ];
        };
      };
    }
    // pkgsOutputs;
}
