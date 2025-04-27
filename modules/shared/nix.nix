# /modules/shared/nix.nix
# Configures common Nix package manager settings.
{ ... }:

{
    nix.settings = {
        experimental-features = [
            "nix-command"
            "flakes"
        ];
        auto-optimise-store = true;
    };

    # Common Garbage Collection settings
    nix.gc = {
        automatic = true;
        dates = "daily"; # Or weekly, etc.
        options = "--delete-older-than 10d";
    };
}
