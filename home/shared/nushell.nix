{ pkgs, lib, ... }:

{
    programs.nushell = {
        enable = true;

        loginFile.text = ''
            exec hyprland
        '';

        extraConfig = '''';

    };
    programs.starship = {
        enable = true;
        settings = {
            add_newline = true;
            character = {
                success_symbol = "[➜](bold green)";
                error_symbol = "[➜](bold red)";
            };
        };
    };
    # home.shell = pkgs.nushell; # enabling this causes error
}
