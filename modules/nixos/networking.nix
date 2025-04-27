# /modules/nixos/networking.nix
# Configures NixOS-specific network management. Hostname is set per-host.
{
    config,
    pkgs,
    lib,
    inputs,
    ...
}:

{
    # Hostname is now defined in hosts/nixos-desktop/default.nix

    # Enable networking using NetworkManager
    networking.networkmanager.enable = true;

    # Default DHCP behavior (often set in hardware-configuration.nix too)
    networking.useDHCP = lib.mkDefault true;

    # Firewall settings (currently disabled/commented out)
    # networking.firewall.enable = false;
}
