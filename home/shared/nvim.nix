# ./home/shared/nvim.nix
# Home Manager module for Neovim (NvChad) configuration

{ pkgs, lib, config, inputs, ... }: 

{
  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;

    # Add your NvChad customizations here using the options
    # Example:
    # extraPackages = with pkgs; [ nil stylua ];
    # extraPlugins = ''
    #   return {
    #     {'folke/tokyonight.nvim', lazy = false, priority = 1000 },
    #   }
    # '';
    # extraConfig = ''
    # '';
  };
}
