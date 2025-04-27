# /etc/nixos/filesystems.nix
{ ... }:

let
    # Define user/group IDs centrally if needed.
    # Replace 1000 with your actual user ID (`id -u nths`)
    # Replace 100 with the 'users' group ID (`getent group users | cut -d: -f3`)
    # Or hardcode if you prefer, but using `id` is safer if you change user ID later.
    userId = 1000;
    usersGroupId = 100;
in
{
    fileSystems."/data/backup" = {
        device = "/dev/disk/by-uuid/b1b08595-d6d9-47b1-855c-ca68db3334de";
        fsType = "ext4";
        options = [ "defaults" ];
        # neededForBoot = false; # Good practice for data drives
    };

    fileSystems."/data/vault" = {
        device = "/dev/disk/by-uuid/E6B0DA25B0D9FC4D";
        fsType = "ntfs";
        options = [
            "defaults"
            "rw"
            "uid=${toString userId}"
            "gid=${toString usersGroupId}"
        ];
        # neededForBoot = false; # Good practice for data drives
    };

    # Add any other filesystem mounts here (like tmpfs, etc.) if desired
}
