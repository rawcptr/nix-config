{ ... }:

let
    username = "nths";
in
{
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "25.05";

    imports = [
        ./shared
        ./nixos
    ];

    # program config
    programs = {
        home-manager.enable = true;
        zoxide.enableNushellIntegration = true; 
    };

    # xdg config
    xdg.enable = true;
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
    };
}
