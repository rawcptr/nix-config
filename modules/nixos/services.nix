# /etc/nixos/services.nix
# Configures system services like SSH, and garbage collection.
{
    config,
    pkgs,
    lib,
    inputs,
    ...
}:

{
    # Automatic Updating
    system.autoUpgrade = {
        enable = false;
        # dates = "weekly";
        # channel = "https://nixos.org/channels/nixos-unstable";
        # flake = "/etc/nixos"; # Tell autoUpgrade to update the flake inputs
    };

    # Enable the OpenSSH daemon.
    services.openssh = {
        enable = true;
        # settings = {
        #   PermitRootLogin = "no"; # Recommended security practice
        #   PasswordAuthentication = false; # Recommended if using SSH keys
        # };
    };

    # Start SSH agent.
    programs.ssh.startAgent = true;

    # Other services:
    # Enable CUPS to print documents.
    # services.printing.enable = true;

    # Example sound service enabling Pipewire
    # sound.enable = true; # Deprecated
    # hardware.pulseaudio.enable = false; # Disable PulseAudio if using Pipewire
    # security.rtkit.enable = true; # Realtime priorities for audio
    # services.pipewire = {
    #   enable = true;
    #   alsa.enable = true;
    #   alsa.support32Bit = true; # If needed
    #   pulse.enable = true;
    #   # If using wireplumber (recommended)
    #   # wireplumber.enable = true;
    # };

    # Placeholder for other potential services
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
}
