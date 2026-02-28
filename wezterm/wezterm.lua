local wezterm = require("wezterm")
local act = wezterm.action
local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"

local config = wezterm.config_builder()
config.initial_cols = 120
config.initial_rows = 40
if is_windows then
	config.default_prog = { "powershell.exe" }
	config.launch_menu = {
		{ label = "ssh deskmini", args = { "ssh", "192.168.0.71" } },
		{ args = { "wsl", "-d", "ubuntu", "--cd", "~" } },
		{ args = { "powershell.exe" } },
	}
else
	config.default_prog = { "/bin/bash" }
end

local appearance = require("appearance")
appearance.apply(config)
local tmux = require("tmux")
tmux.apply(config)

return config
