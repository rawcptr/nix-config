{ pkgs, inputs, ... }:

let
    zen-browser = inputs.zen-browser.packages.${pkgs.system}.default;
in
{

    programs = {
        ripgrep.enable = true;
        direnv.enable = true;
        fastfetch = {
            enable = true;
        };
        ghostty = {
            enable = true;
            settings = {
                theme = "Belafonte Day";
                font-size = 10;
                window-padding-x = 4;
                window-padding-y = 4;
            };
        };
    };

    home.packages = with pkgs; [
        # cli programs
        tree
        wl-clipboard

        # essentials
        zen-browser

        # Hardware & Montoring
        lm_sensors
    ];
}
