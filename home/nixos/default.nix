{ lib, pkgs, ... }:
let
    isLinux = pkgs.stdenv.isLinux;
in
lib.mkIf isLinux {

    xdg.configFile = {
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
