{ pkgs, inputs, ... }:

let
    zen-browser = inputs.zen-browser.packages.${pkgs.system}.default;
in
{
    home.packages = with pkgs; [
        # terminals
        ghostty

        # cli programs 
        ripgrep 
        tree 
        fastfetch 
        wl-clipboard
        starship

        # essentials
        zen-browser
        direnv

        # Hardware & Montoring 
        lm_sensors
    ];
}
