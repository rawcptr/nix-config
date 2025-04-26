# /etc/nixos/packages.nix
# Defines system-wide packages installed in the environment profile.
{ config, pkgs, lib, inputs, ... }: # Needs pkgs and inputs

{
  environment.systemPackages = with pkgs; [
    # Essentials & CLI Tools
    vim
    wget
    htop
    curl
    man-db # Provides man pages (man is often just a wrapper)
    tree
    ripgrep
    git
    nushell # Make sure it's available system-wide too
    fastfetch
    wl-clipboard # Wayland clipboard utilities
    usbutils # lsusb
    pciutils # lspci

    # Hardware & Monitoring
    lm_sensors

    # Build Tools (Consider if needed globally or better in devShells)
    gcc
    clang
    llvm
    uv # Python packaging

    # Terminals / GUI Apps (consider if better in user env/HM)
    ghostty
    inputs.zen-browser.packages.${pkgs.system}.default # Zen Browser via flake input
  ];
}
