-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Colorful Colors (terminal.sexy)'
config.color_scheme = "ncf"
config.color_schemes = {
    ["ncf"] = dofile(wezterm.config_dir .. "/colors/ncf.lua")
}
config.font = wezterm.font('JetBrains Mono', {
    weight = 'DemiBold',
    stretch="Normal",
    style="Normal"
})
config.enable_tab_bar = false

-- and finally, return the configuration to wezterm
return config