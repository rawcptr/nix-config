{ pkgs, ... }:
{

    # configPart = x: builtins.readFile x;
    # hyprlandConfigs = [
    #     ./configs/hypr/hyprland.conf
    # ];

    imports = [ ./hypr.nix ];

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
