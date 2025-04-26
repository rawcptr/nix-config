# /etc/nixos/bootloader.nix
# Defines bootloader settings.
{ config, pkgs, lib, inputs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
