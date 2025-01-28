-- Pull in the WezTerm API
local wezterm = require("wezterm")

-- Configuration builder for better validation
local config = wezterm.config_builder()

-- Local variables and helper functions
local act = wezterm.action
local current_opacity = 1.0

-- Toggle window opacity between two levels
local function toggle_opacity(window)
	current_opacity = current_opacity == 1.0 and 0.8 or 1.0
	window:set_config_overrides({
		window_background_opacity = current_opacity,
	})
end

-- Core configuration
config.color_scheme = "GruvboxDark" -- Consistent theme
config.font = wezterm.font("MesloLGS Nerd Font Mono") -- Preferred font
config.font_size = 12.0 -- Font size
config.enable_tab_bar = false -- Disable tab bar for minimal look
config.window_decorations = "RESIZE" -- Use resize-only decorations to align with KDE's behavior
config.enable_wayland = true -- Explicitly enable Wayland support

-- Key bindings
config.keys = {
	-- Paste from clipboard
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	-- Paste from primary selection
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("PrimarySelection") },
	-- Toggle opacity with Ctrl+Shift+O
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window)
			toggle_opacity(window)
		end),
	},
}

-- Dynamic window title for better KDE integration
wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	local zoomed = tab.active_pane.is_zoomed and "[Z] " or ""
	local tab_index = #tabs > 1 and string.format("[%d/%d] ", tab.tab_index + 1, #tabs) or ""
	return string.format("wezterm: %s%s%s", zoomed, tab_index, tab.active_pane.title)
end)

-- Return the final configuration
return config
