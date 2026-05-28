hl.on("hyprland.start", function()
    hl.exec_cmd("bash -c '/usr/sbin/anacron -s -t \"${HOME}/.local/etc/anacrontab\" -S \"${HOME}/.local/var/spool/anacron\"'")
    hl.exec_cmd("sunsetr")
end)
