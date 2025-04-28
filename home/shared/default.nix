{ ... }:
{
    imports = [
        ./nushell.nix # nushell config
        ./nvim.nix
        ./packages.nix
    ];

    xdg.configFile = {
        "./ghostty/config" = {
            source = ./configs/ghostty-config;
        };
    };
}
