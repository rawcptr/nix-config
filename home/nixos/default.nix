{ lib, pkgs, ... }:
let
    islinux = pkgs.stdenv.islinux;
in
lib.mkif islinux {

    xdg.configfile = {
        "./hypr/hyprland.conf" = {
            source = ./configs/hyprland.conf;
        };
    };

    # define more pkgs for hyprland
    home.packages = with pkgs; [
        grim
        slurp
    ];
}
