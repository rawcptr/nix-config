# ./home/nixos/hypr.nix
{
    inputs,
    lib,
    pkgs,
    config, # Important: Need config for homeDirectory
    ...
}:
let
    isLinux = pkgs.stdenv.isLinux;
in
lib.mkIf isLinux {

    # Configure hyprlock (This is a valid Home Manager program module)
    programs.hyprlock = {
        enable = true;
        # ... your hyprlock settings ...
        settings.general = {
            disable_loading_bar = true;
            grace = 300;
            hide_cursor = true;
            no_fade_in = false;
        };
        settings.background = {
            path = "screenshot";
            blur_passes = 3;
            blur_size = 8;
        };
        settings."input-field" = [
            # Note the quotes for "input-field"
            {
                size = "200, 50";
                position = "0, -80";
                monitor = "";
                dots_center = true;
                fade_on_empty = false;
                font_color = "rgb(202, 211, 245)";
                inner_color = "rgb(91, 96, 120)";
                outer_color = "rgb(24, 25, 38)";
                outline_thickness = 5;
                placeholder_text = "<span foreground=\"##cad3f5\">Password...</span>";
                shadow_passes = 2;
            }
        ];
    };

    # Enable Hyprland Wayland compositor using the correct Home Manager module
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        xwayland.enable = true;

        # === NIX CONFIGURATION START ===
        settings = {
            # See https://wiki.hyprland.org/Configuring/Monitors/
            monitor = [ ",preferred,auto,auto" ];

            # See https://wiki.hyprland.org/Configuring/Environment-variables/
            env = [
                "XCURSOR_SIZE,24"
                "HYPRCURSOR_SIZE,24"
            ];

            # https://wiki.hyprland.org/Configuring/Variables/#general
            general = {
                gaps_in = 5;
                gaps_out = 20;
                border_size = 2;
                "col.active_border" = "0xFF52525B 45deg"; # Use quotes for gradient/complex colors
                "col.inactive_border" = "0xFF27272A"; # Quotes recommended for colors
                resize_on_border = false;
                allow_tearing = false;
                layout = "dwindle";
            };

            # https://wiki.hyprland.org/Configuring/Variables/#decoration
            decoration = {
                rounding = 10;

                active_opacity = 1.0;
                inactive_opacity = 1.0;

                # drop_shadow = true; # Use drop_shadow instead of nested shadow block
                # shadow_range = 4;
                # shadow_render_power = 3;
                # "col.shadow" = "rgba(1a1a1aee)"; # Use quotes
                #
                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;
                    vibrancy = 0.1696;
                };
            };

            # https://wiki.hyprland.org/Configuring/Variables/#animations
            animations = {
                enabled = true;

                bezier = [
                    "easeOutQuint,0.23,1,0.32,1"
                    "easeInOutCubic,0.65,0.05,0.36,1"
                    "linear,0,0,1,1"
                    "almostLinear,0.5,0.5,0.75,1.0"
                    "quick,0.15,0,0.1,1"
                ];

                animation = [
                    "global, 1, 10, default"
                    "border, 1, 5.39, easeOutQuint"
                    "windows, 1, 4.79, easeOutQuint"
                    "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
                    "windowsOut, 1, 1.49, linear, popin 87%"
                    "fadeIn, 1, 1.73, almostLinear"
                    "fadeOut, 1, 1.46, almostLinear"
                    "fade, 1, 3.03, quick"
                    "layers, 1, 3.81, easeOutQuint"
                    "layersIn, 1, 4, easeOutQuint, fade"
                    "layersOut, 1, 1.5, linear, fade"
                    "fadeLayersIn, 1, 1.79, almostLinear"
                    "fadeLayersOut, 1, 1.39, almostLinear"
                    "workspaces, 1, 1.94, almostLinear, fade"
                    "workspacesIn, 1, 1.21, almostLinear, fade"
                    "workspacesOut, 1, 1.94, almostLinear, fade"
                ];
            };

            # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
            master = {
                new_status = "master";
            };

            # https://wiki.hyprland.org/Configuring/Variables/#misc
            misc = {
                force_default_wallpaper = -1;
                disable_hyprland_logo = false;
            };

            # https://wiki.hyprland.org/Configuring/Variables/#input
            input = {
                kb_layout = "us";
                kb_variant = "";
                kb_model = "";
                kb_options = "";
                kb_rules = "";

                follow_mouse = 1;
                sensitivity = 0.0; # Use float notation

                touchpad = {
                    natural_scroll = false;
                };
            };

            # https://wiki.hyprland.org/Configuring/Variables/#gestures
            gestures = {
                workspace_swipe = false;
            };

            # https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs
            device = [
                {
                    name = "epic-mouse-v1";
                    sensitivity = -0.5;
                }
            ];

            # Define binds using lists of strings
            # $mainMod = SUPER is implied by using "SUPER" below

            bind = [
                "SUPER, T, exec, ghostty" # $terminal replaced
                "SUPER, B, exec, zen" # $browser replaced
                "SUPER, Q, killactive,"
                "SUPER, M, exit,"
                "SUPER, E, exec, dolphin" # $fileManager replaced
                "SUPER, V, togglefloating,"
                "SUPER, R, exec, rofi --show drun" # $menu replaced
                "SUPER, P, pseudo," # dwindle
                "SUPER, J, togglesplit," # dwindle

                # Move focus
                "SUPER, left, movefocus, l"
                "SUPER, right, movefocus, r"
                "SUPER, up, movefocus, u"
                "SUPER, down, movefocus, d"

                # Switch workspaces
                "SUPER, 1, workspace, 1"
                "SUPER, 2, workspace, 2"
                "SUPER, 3, workspace, 3"
                "SUPER, 4, workspace, 4"
                "SUPER, 5, workspace, 5"
                "SUPER, 6, workspace, 6"
                "SUPER, 7, workspace, 7"
                "SUPER, 8, workspace, 8"
                "SUPER, 9, workspace, 9"
                "SUPER, 0, workspace, 10"

                # Move active window
                "SUPER SHIFT, 1, movetoworkspace, 1"
                "SUPER SHIFT, 2, movetoworkspace, 2"
                "SUPER SHIFT, 3, movetoworkspace, 3"
                "SUPER SHIFT, 4, movetoworkspace, 4"
                "SUPER SHIFT, 5, movetoworkspace, 5"
                "SUPER SHIFT, 6, movetoworkspace, 6"
                "SUPER SHIFT, 7, movetoworkspace, 7"
                "SUPER SHIFT, 8, movetoworkspace, 8"
                "SUPER SHIFT, 9, movetoworkspace, 9"
                "SUPER SHIFT, 0, movetoworkspace, 10"

                # Special workspace
                "SUPER, S, togglespecialworkspace, magic"
                "SUPER SHIFT, S, movetoworkspace, special:magic"

                # Scroll workspaces
                "SUPER, mouse_down, workspace, e+1"
                "SUPER, mouse_up, workspace, e-1"
            ];

            # Move/resize windows
            bindm = [
                "SUPER, mouse:272, movewindow"
                "SUPER, mouse:273, resizewindow"
            ];

            # Multimedia keys (no lock)
            bindl = [
                ", XF86AudioNext, exec, playerctl next"
                ", XF86AudioPause, exec, playerctl play-pause"
                ", XF86AudioPlay, exec, playerctl play-pause"
                ", XF86AudioPrev, exec, playerctl previous"
            ];

            # Multimedia keys (passthrough)
            bindel = [
                ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
                ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
            ];

            # See https://wiki.hyprland.org/Configuring/Window-Rules/
            windowrule = [
                # Example: "float,class:^(kitty)$,title:^(kitty)$"
                "suppressevent maximize, class:.*"
                "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0" # Fix dragging issues
            ];

            # Workspace rules (examples commented out, uncomment/add as needed)
            # workspace = [
            #   "w[tv1], gapsout:0, gapsin:0"
            #   "f[1], gapsout:0, gapsin:0"
            # ]
            # windowrule = [
            #   "bordersize 0, floating:0, onworkspace:w[tv1]"
            #   "rounding 0, floating:0, onworkspace:w[tv1]"
            #   "bordersize 0, floating:0, onworkspace:f[1]"
            #   "rounding 0, floating:0, onworkspace:f[1]"
            # ]

            # Autostart rules
            exec-once = [
                "swww kill; swww-daemon"
                "sleep 1"
                # Use config.home.homeDirectory instead of ~ for robustness
                "swww img ${config.home.homeDirectory}/Pictures/papes/wallhaven-qzwxgq_3840x2160.png --transition-fps=144 --transition-duration=1 --transition-pos=top-right --transition-type=grow"
                "wl-paste --type text --watch cliphist store"
                "wl-paste --type image --watch cliphist store"
                # Use single quotes inside double quotes for the command argument
                "gsettings set org.gnome.desktop.interface cursor-theme 'macOS'"
                # Add other exec-once items here like:
                # "waybar"
                # "nm-applet --indicator"
            ];
        }; # === NIX CONFIGURATION END ===

    }; # End wayland.windowManager.hyprland

    # Ensure necessary packages for keybindings etc. are installed
    home.packages = with pkgs; [
        rofi # For the $menu bind
        kdePackages.dolphin
        wl-clipboard # For wl-paste in exec-once
        cliphist # For wl-paste target in exec-once
        brightnessctl # For brightness keybinds
        playerctl # For media keybinds
        swww # For wallpaper in exec-once
        pkgs.gnome-settings-daemon
        libnotify # For notifications often used with keybinds or scripts
    ];

}
