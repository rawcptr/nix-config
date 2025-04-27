# /modules/shared/core.nix
# Defines core, shared settings like stateVersion
{ lib, config, ... }:
{
    system.stateVersion = "24.11";
}
