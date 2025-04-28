{ lib, pkgs, ... }:
let
    isDarwin = pkgs.stdenv.isDarwin;
in
lib.mkif isDarwin { }
