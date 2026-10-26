----------------
--- MONITORS ---
----------------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

local M = {
    main   = "eDP-1",
    second = "DP-2",
}

hl.monitor({ output = M.main,   mode = "2560x1600@165", position = "0x0",    scale = 1 })
hl.monitor({ output = M.second, mode = "1920x1080@60",  position = "2560x0", scale = 1 })

return M
