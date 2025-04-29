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

    services.swww.enable = true;

    # define more pkgs for ricing
    home.packages = with pkgs; [
        grim
        slurp
        dconf-editor
    ];
    home.pointerCursor = {
        enable = true;
        gtk.enable = true;
        hyprcursor.enable = true;
        size = 24;
        package = pkgs.apple-cursor;
        name = "macOS";
    };
}
