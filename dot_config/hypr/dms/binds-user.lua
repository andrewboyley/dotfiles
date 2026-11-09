-- DMS user keybind overrides (edit via Control Center or dms; do not remove this header)

hl.unbind("S")
hl.unbind("SUPER + Return")
hl.bind("SUPER + Return", hl.dsp.exec_cmd("alacritty"))

-- Relative workspace navigation and window movement.
hl.unbind("SUPER + CTRL + left")
hl.unbind("SUPER + CTRL + right")
hl.unbind("SUPER + SHIFT + CTRL + left")
hl.unbind("SUPER + SHIFT + CTRL + right")

hl.bind("SUPER + CTRL + left", hl.dsp.focus({ workspace = "r-1" }))
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "r+1" }))
hl.bind("SUPER + CTRL + SHIFT + left", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind("SUPER + CTRL + SHIFT + right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind("SUPER + ALT + left", hl.dsp.window.move({ workspace = "r-1", follow = false }))
hl.bind("SUPER + ALT + right", hl.dsp.window.move({ workspace = "r+1", follow = false }))

-- Relative monitor navigation and window movement.
hl.unbind("SUPER + CTRL + down")
hl.unbind("SUPER + CTRL + up")
hl.unbind("SUPER + SHIFT + CTRL + down")
hl.unbind("SUPER + SHIFT + CTRL + up")

hl.bind("SUPER + CTRL + down", hl.dsp.focus({ monitor = "d" }))
hl.bind("SUPER + CTRL + up", hl.dsp.focus({ monitor = "u" }))
hl.bind("SUPER + CTRL + SHIFT + down", hl.dsp.window.move({ monitor = "d", follow = true }))
hl.bind("SUPER + CTRL + SHIFT + up", hl.dsp.window.move({ monitor = "u", follow = true }))
hl.bind("SUPER + ALT + down", hl.dsp.window.move({ monitor = "d", follow = false }))
hl.bind("SUPER + ALT + up", hl.dsp.window.move({ monitor = "u", follow = false }))

hl.unbind("SUPER + D")
hl.unbind("SUPER + F")
hl.unbind("SUPER + SHIFT + T")
hl.bind("SUPER + D", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }))

-- Default applications.
hl.unbind("SUPER + W")
hl.bind("SUPER + W", hl.dsp.exec_cmd([[sh -c 'cmd=$(xdg-settings get default-web-browser 2>/dev/null | sed "s/\.desktop$//"); exec "${cmd:-firefox}"']]))
hl.bind("SUPER + E", hl.dsp.exec_cmd("xdg-open \"$HOME\""))
