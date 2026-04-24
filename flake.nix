{
  description = "Polarstern M4 MacBook Air Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, darwin, home-manager, ... }: {
    darwinConfigurations."polarstern" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/polarstern/default.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.phil = { pkgs, ... }: {
            # Hier erzwingen wir die Pfade direkt
            home.username = "phil";
            home.homeDirectory = "/Users/phil";
            home.stateVersion = "24.11";
            imports = [ ./home.nix ];
          };
        }
      ];
    };
  };
}
