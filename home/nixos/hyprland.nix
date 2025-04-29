{ pkgs, inputs, ... }:
{
    security.pam.services.hyprlock = { };

    programs.hyprlock = {
        enable = true;
        settings.general = {
            disable_loading_bar = true;
            grace = 300;
            hide_cursor = true;
            no_fade_in = false;
        };
        settings.background = {
            path = "screenshot";
            blur_passes = 3;
            blur_size = 8;
        };
        settings.input-field = [
            {
                size = "200, 50";
                position = "0, -80";
                monitor = "";
                dots_center = true;
                fade_on_empty = false;
                font_color = "rgb(202, 211, 245)";
                inner_color = "rgb(91, 96, 120)";
                outer_color = "rgb(24, 25, 38)";
                outline_thickness = 5;
                placeholder_text = "<span foreground=\"##cad3f5\">Password...</span>";
                shadow_passes = 2;
            }
        ];
    };

    # Enable Hyprland Wayland compositor
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage =
            inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        xwayland.enable = true; # Enable XWayland support
    };

    xdg.configFile = {
        "./hypr/hyprland.conf".source = ./configs/hypr/hyprland.conf;
    };
}
