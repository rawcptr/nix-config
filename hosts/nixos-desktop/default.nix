# /hosts/nixos-desktop/default.nix
# Main configuration entry point for the 'nixos-desktop' host.
{
    inputs,
    pkgs,
    lib,
    config,
    ...
}:
{
    imports = [
        # Host-specific hardware and filesystem configurations
        ./hardware-configuration.nix
        ./filesystems.nix

        # Import all shared modules
        ../../modules/shared/core.nix # defines stateVersion
        ../../modules/shared/locale.nix # defines locales
        ../../modules/shared/nix.nix # defines nix pacakge manager stuff
        ../../modules/shared/packages.nix # defines system packages
        ../../modules/shared/users.nix # User definitions are shared

        # Import all NixOS-specific modules
        ../../modules/nixos/bootloader.nix
        ../../modules/nixos/graphics-nvidia.nix
        ../../modules/nixos/networking.nix
        ../../modules/nixos/services.nix

        ./caches.nix # host-specific cache
    ];

    # == Host-specific settings ==

    networking.hostName = "nixos-desktop"; # Set the unique hostname here
}
