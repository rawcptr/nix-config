# ./home/shared/nvim.nix
# Home Manager module for Neovim (NvChad) configuration

{ pkgs, inputs, ... }:

{
    imports = [
        inputs.nvchad4nix.homeManagerModule
    ];

    programs.nvchad = {
        enable = true;

        extraPackages = with pkgs; [
            # system
            wl-clipboard
            python3
            gcc

            # Formatters
            stylua # lua formatter
            nixfmt-rfc-style # Nix (RFC Style fmt)

            # LSPs
            nixd # nix
            # clangd # c/++
            ruff # python
            isort # python import sorter
        ];

        extraPlugins = ''
            return {
                {  'mrcjkb/rustaceanvim', version = '^6', lazy = false },
            }
        '';

        extraConfig = ''

        '';

        backup = false;
    };
}
