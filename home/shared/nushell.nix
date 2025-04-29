{ pkgs, ... }:

{
    home.shell.enableNushellIntegration = true;

    programs.nushell = {
        enable = true;
        extraConfig = '''';
        loginFile.text = if pkgs.stdenv.isLinux then "exec hyprland" else "";

        settings = {
            show_banner = false;
        };

        shellAliases = {
            cd = "z";
        };
    };

    programs.zoxide = {
        enable = true;
        enableBashIntegration = true;
        enableNushellIntegration = true;
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
