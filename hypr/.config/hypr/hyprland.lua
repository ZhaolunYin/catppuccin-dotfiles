local home = os.getenv("HOME") or "/home/zhaolun"

require("modules.style")

require("modules.monitors")

-- Environment Variables
hl.env("XCURSOR_SIZE", "36")
hl.env("HYPRCURSOR_SIZE", "36")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("LIBVA_DRIVER_NAME", "amd")
hl.env("GNOME_KEYRING_CONTROL", "/run/user/1000/keyring")

hl.config({
    dwindle = {
        force_split = 0,
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
    xwayland = {
        force_zero_scaling = true,
    },
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "caps:escape,shift:both_capslock",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
            tap_to_click = true,
            scroll_factor = 0.8,
        },
    },
    binds = {
        drag_threshold = 10,
    },
})

hl.workspace_rule({ workspace = "r[1-4]", layout = "dwindle" })
hl.workspace_rule({ workspace = "r[5-8]", layout = "scrolling" })
hl.workspace_rule({ workspace = "9", layout = "monocle" })

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})


hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("quickshell")
    hl.exec_cmd("dunst")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("systemctl --user restart wireplumber")
    hl.exec_cmd("systemctl --user import-environment")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("surge server start")
    hl.exec_cmd('theclicker run -d"/dev/input/ak820-kbd" -c25 -C0 -l67')
    hl.exec_cmd('theclicker run -d"/dev/input/by-path/platform-i8042-serio-0-event-kbd" -c25 -C0 -l67')
end)

hl.on("hyprland.shutdown", function()
    hl.exec_cmd("exit")
end)

require("modules.binds")
