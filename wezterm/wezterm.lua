local wezterm = require 'wezterm'
local config = {}

config.font_size = 18

-- Launch wezterm in full screen mode
wezterm.on('gui-startup', function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
