{ lib, pkgs, ... }:
let
    isLinux = pkgs.stdenv.isLinux;
in
lib.mkIf isLinux {

    xdg.configFile = {
        "./hypr/conf/hyprland.conf" = {
            source = ./hypr/conf/hyprland.conf;
        };
    };

    # define more pkgs for hyprland
    home.packages = with pkgs; [
        grim
        slurp
    ];
}
