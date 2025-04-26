{
	description = "NixOS System Configuration";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		
		# home manager
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		
		# zen-browser
		zen-browser.url = "github:youwen5/zen-browser-flake";
		zen-browser.inputs.nixpkgs.follows = "nixpkgs";

		# hyprland
		hyprland.url = "github:hyprwm/Hyprland";
	};
	
	outputs = { self, nixpkgs, zen-browser, ... }@inputs:
	let
		system = "x86_64-linux"; 
		pkgs = import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};
	in
	{
		nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
			inherit system pkgs;
			specialArgs = { inherit inputs; };
			
			modules = [
				./configuration.nix
				./hardware-configuration.nix
				./cachix.nix
			];
		};
	};
}
		
