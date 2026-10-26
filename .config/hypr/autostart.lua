-----------------
--- AUTOSTART ---
-----------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Run once at startup (formerly exec-once)
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("~/.config/hypr/scripts/xdg-portal-hyprland.sh")

    hl.exec_cmd("swaync")
    hl.exec_cmd("foot -s")
    hl.exec_cmd("waybar")
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("~/.local/bin/waypaper --restore")
end)

-- Run at startup and on every reload (formerly exec)
local function applyShade()
    hl.exec_cmd("hyprshade auto")
end
hl.on("hyprland.start", applyShade)
hl.on("config.reloaded", applyShade)
