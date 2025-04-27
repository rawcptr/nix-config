# /modules/nixos/bootloader.nix
# Defines bootloader settings.
{ ... }:

{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}
