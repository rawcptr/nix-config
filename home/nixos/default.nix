{ lib, pkgs, ... }:
let
    isLinux = pkgs.stdenv.isLinux;
in
lib.mkIf isLinux {

    # configPart = x: builtins.readFile x;
    # hyprlandConfigs = [
    #     ./configs/hypr/hyprland.conf
    # ];

    import = [
        ./hyprland.nix
    ];

    # define more pkgs for ricing
    home.packages = with pkgs; [
        grim
        slurp
        dconf-editor
        swww
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
