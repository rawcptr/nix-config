# /etc/nixos/users.nix
# Defines user accounts and related settings like default shell and auto-login.
{ config, pkgs, lib, inputs, ... }: # Needs pkgs for pkgs.nushell

{
  users.users.nths = {
    isNormalUser = true;
    description = "enty";
    extraGroups = [ "networkmanager" "wheel" ]; # wheel for sudo access
    shell = if pkgs ? nushell then pkgs.nushell else pkgs.bashInteractive;
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = lib.mkIf (config.users.users ? nths) "nths";
}
