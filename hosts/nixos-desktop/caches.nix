# /hosts/nixos-desktop/caches.nix
# This module imports the specific binary cache configurations
# that should be active for the 'nixos-desktop' host.
{
    pkgs,
    lib,
    config,
    ...
}: # Standard module header

{
    imports = [
        # List the paths to the actual cache definition files
        # relative to the main flake.nix location (top level).
        ../../cachix/cuda-maintainers.nix
        ../../cachix/hyprland.nix
        ../../cachix/nix-community.nix

        # Add any other caches needed ONLY for nixos-desktop here.
        # Example: ../../cachix/some-other-desktop-cache.nix
    ];

    # This file doesn't need to define any other options itself,
    # its sole purpose is to group the cache imports for this host.
}
