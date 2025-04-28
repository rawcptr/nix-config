{ lib, pkgs, ... }:
let
    isDarwin = pkgs.stdenv.isDarwin;
in
lib.mkIf isDarwin { }
