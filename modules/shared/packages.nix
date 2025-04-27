# /modules/shared/packages.nix
# Defines system-wide packages installed in the environment profile.
{ pkgs, ... }: # Needs pkgs and inputs

{
    environment.systemPackages = with pkgs; [
        # Essentials & CLI Tools
        vim
        wget
        htop
        curl
        man-db # Provides man pages (man is often just a wrapper)
        git
        nushell # Make sure it's available system-wide too
        unzip

        # Build Tools (Consider if needed globally or better in devShells)
        gcc
        clang
        llvm
        uv # Python packaging
        rustup
    ];
}
