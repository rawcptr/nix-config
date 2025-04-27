# /etc/nixos/locale.nix
# Sets time zone, locale, and keyboard layout.
{
    config,
    pkgs,
    lib,
    inputs,
    ...
}:

{
    # Set your time zone.
    time.timeZone = "Asia/Kolkata";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_IN";
        LC_IDENTIFICATION = "en_IN";
        LC_MEASUREMENT = "en_IN";
        LC_MONETARY = "en_IN";
        LC_NAME = "en_IN";
        LC_NUMERIC = "en_IN";
        LC_PAPER = "en_IN";
        LC_TELEPHONE = "en_IN";
        LC_TIME = "en_IN";
    };

    # Configure keymap in X11/Wayland console
    # Note: Hyprland handles its own keymap for the graphical session.
    # This affects TTYs and potentially some early boot/login scenarios.
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };
}
