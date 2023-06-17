local wezterm = require 'wezterm'

-- Launch wezterm in full screen mode
wezterm.on('gui-startup', function(cmd)
    local _, _, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

local config = {}

config.font_size = 18
config.keys = {
    -- Hack used to emulate Ctrl+Backspace behaviour on windows for wezterm
    -- while using nvim! Nvim should have its own keymapping for Ctrl+Backspace
    -- in insert mode to call Ctrl+w, but in terminal, the backspace is not sent
    -- properly, therefore this hack allows it to work properly in terminals.
    -- Note that this is a non-issue for GUI nvim instances like neovide, which
    -- will support this keymapping perfectly fine using the nvim keymappings.
    {
        key = 'Backspace',
        mods = 'CTRL',
        action = wezterm.action.SendKey {
            mods = 'CTRL',
            key = 'w',
        },
    },
}


return config
