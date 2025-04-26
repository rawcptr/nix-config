# /etc/nixos/nix.nix
# Configures the Nix package manager itself.
{ config, pkgs, lib, inputs, ... }:

{
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true; # Optimise store by deduplication
    # Optionally add binary caches for faster builds
    # substituters = [ "https://cache.nixos.org/" "https://your-cachix-cache.cachix.org" ];
    # trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "your-cachix-cache.cachix.org-..." ];
  };

  # Keep this if you added cachix.nix and want it managed here
  # Or integrate cachix settings directly into nix.settings above
  # imports = [ ./cachix.nix ]; # If cachix.nix defines nix.settings options
}
