{ pkgs, lib, config, inputs, system, ... }:

let 
    username = "nths";
in 
{ 
    home.username = username;
    home.homeDirectory = "/home/${username}"; 


    home.stateVersion = "25.05"; 
    
    imports = [
	./shared/nushell.nix
	./shared/packages.nix
    ];

    # basic config
    programs.home-manager.enable = true;

    # xdg config
    xdg.enable = true;
    xdg.userDirs = {
	enable = true;
	createDirectories = true;
    };
}
