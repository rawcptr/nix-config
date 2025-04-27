# /etc/nixos/graphical.nix
# Configures Hyprland, Wayland, NVIDIA drivers, and related graphical settings.
{
    config,
    pkgs,
    lib,
    inputs,
    ...
}: # Needs config, pkgs, inputs

{
    # Enable Hyprland Wayland compositor
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage =
            inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        xwayland.enable = true; # Enable XWayland support
    };

    # Hint for electron apps to use Wayland backend
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # NVIDIA Driver Configuration
    hardware.graphics = {
        enable = true; # Manages OpenGL drivers generally
        # extraPackages = with pkgs; [ nvidia-vaapi-driver ]; # If you need VAAPI for NVIDIA
    };

    # Explicitly use NVIDIA proprietary drivers
    services.xserver.videoDrivers = [ "nvidia" ]; # Still relevant even for Wayland for modesetting/DRM

    hardware.nvidia = {
        # Use the official proprietary NVIDIA driver
        modesetting.enable = true; # Essential for Wayland/modern Xorg

        # Didn't check power management stability so disabling it for now.
        powerManagement.enable = false;
        powerManagement.finegrained = false;

        # Use the proprietary driver, not 'open' kernel module
        # 'open' kernel module resulted in flickering of mouse on zen-browser
        open = false;

        # Install nvidia-settings utility
        nvidiaSettings = true;

        # Use the 'stable' branch version from kernelPackages
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Ensure necessary libs for nvidia are available
    hardware.graphics.enable32Bit = true; # If you need 32-bit nvidia libs for Steam/Wine
}
