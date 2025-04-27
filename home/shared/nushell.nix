{ pkgs, lib, ... }: 

{
    programs.nushell = {
	enable = true;
    };
    
    # home.shell = pkgs.nushell; # enabling this causes error
}
