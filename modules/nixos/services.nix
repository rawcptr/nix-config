# /modules/nixos/services.nix
# Configures system services like SSH, and garbage collection.
{ ... }:

{
    # Automatic Updating
    system.autoUpgrade = {
        enable = false;
        # dates = "weekly";
        # channel = "https://nixos.org/channels/nixos-unstable";
        # flake = "/etc/nixos"; # Tell autoUpgrade to update the flake inputs
    };

    hardware = {
        pulseaudio.enable = false;
        bluetooth.enable = true;
        bluetooth.settings = {
            General = {
                Experimental = false;
            };
        };
    };

    services = {
        openssh.enable = true;
        blueman.enable = false;
        kanata.enable = false;
        nixseparatedebuginfod.enable = true;
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            wireplumber.enable = true;
            jack.enable = false;
        };
    };

    # Start SSH agent.
    programs.ssh.startAgent = true;

    # hyprlock services
    security.pam.services.hyprlock = { };
    security.rtkit.enable = true; # Realtime scheduling for pipewire and pulseaudio

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
