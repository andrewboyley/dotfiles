
hl.gesture({
    fingers = 4,
    direction = "right",
    mod = "Alt",
    action = "dispatcher",
    arg = "movetoworkspacesilent, r+1"
})
hl.gesture({
    fingers = 4,
    direction = "left",
    mod = "Alt",
    action = "dispatcher",
    arg = "movetoworkspacesilent, r-1"
})
hl.gesture({
    fingers = 4,
    direction = "left",
    mod = "Shift",
    action = "dispatcher",
    arg = "movetoworkspace, r+1"
})
hl.gesture({
    fingers = 4,
    direction = "right",
    mod = "Shift",
    action = "dispatcher",
    arg = "movetoworkspace, r-1"
})
hl.gesture({
    fingers = 4,
    direction = "down",
    action = "unset"
})
hl.gesture({
    fingers = 4,
    direction = "down",
    action = "close"
})
