# /flake.nix
{
  description = "Multi-system Nix Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-config = {
      url = "github:rawcptr/nvconfig";
      flake = false;
    };
    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvchad-starter.follows = "nvim-config";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nvchad4nix,
      nvim-config,
      ...
    }@inputs:
    let
      # Define supported systems
      systems = [
        "x86_64-linux" # , "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;

      # Create pkgs set for each system
      pkgsFor = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          # overlays = [ ... ];
        }
      );

      # Define specialArgs to pass inputs down
      specialArgs = { inherit inputs; };
    in
    {
      # NixOS Configurations
      nixosConfigurations."nixos-desktop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;
        pkgs = pkgsFor."x86_64-linux";
        modules = [
          # === Only import the host's main entry point ===
          ./hosts/nixos-desktop/default.nix
          # === Optional: Add Home Manager module here ===
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # Adapt this path when you set up Home Manager config files
            home-manager.backupFileExtension = "bak";
            home-manager.users.nths = import ./home/home.nix;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };

      # Darwin Configurations (Placeholder)
      # darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
      #   system = "aarch64-darwin"; # Or x86_64-darwin
      #   inherit specialArgs;
      #   pkgs = pkgsFor."aarch64-darwin"; # Adjust system name
      #   modules = [
      #     ./hosts/macbook/default.nix # Entry point for macbook host
      #     # home-manager.darwinModules.home-manager
      #     # { ... home manager config ... }
      #   ];
      # };
    };
}


