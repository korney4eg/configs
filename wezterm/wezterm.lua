-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.background = {
	-- This is the deepest/back-most layer. It will be rendered first
	{
		source = {
			File = os.getenv("HOME") .. '/configs/wezterm/stars-bg.jpg',
		},
		-- The texture tiles vertically but not horizontally.
		-- When we repeat it, mirror it so that it appears "more seamless".
		-- An alternative to this is to set `width = "100%"` and have
		-- it stretch across the display
		repeat_x = 'Mirror',
		hsb = { brightness = 0.1 },
		-- When the viewport scrolls, move this layer 10% of the number of
		-- pixels moved by the main viewport. This makes it appear to be
		-- further behind the text.
		attachment = { Parallax = 0.1 },
	},
}

-- and finally, return the configuration to wezterm
return config
