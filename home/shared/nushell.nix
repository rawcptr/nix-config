{ pkgs, ... }:

{
    programs.nushell = {
        enable = true;
        extraConfig = '''';
        loginFile.text = if pkgs.stdenv.isLinux then ''
            exec hyprland
        '' else "";
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
}
