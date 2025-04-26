# /etc/nixos/users.nix
# Defines user accounts and related settings like default shell and auto-login.
{ config, pkgs, lib, inputs, ... }: # Needs pkgs for pkgs.nushell

{
  users.users.nths = {
    isNormalUser = true;
    description = "enty";
    extraGroups = [ "networkmanager" "wheel" ]; # wheel for sudo access
    packages = with pkgs; [
      # You can add user-specific packages here if not using Home Manager
      # Example: neofetch
    ];
    shell = pkgs.nushell; # set nushell as default shell
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "nths";
}
