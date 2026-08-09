---------------------
---- KEYBINDINGS ----
---------------------

mainMod = "SUPER"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Custom scripts
hl.bind(
	mainMod .. " + ALT + V",
	hl.dsp.exec_cmd(
		'cliphist list | rofi -theme "~/.config/rofi/launchers/type-1/style-5.rasi" -dmenu -i -p "Clipboard:" | cliphist decode | wl-copy'
	)
)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("~/.local/bin/gpu-switcher"))
hl.bind(mainMod .. " + ALT +  S", hl.dsp.exec_cmd("~/.local/bin/screenshot"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.local/bin/randwallpaper"))

-- Focus Windows
hl.bind(mainMod .. " + " .. left, hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. right, hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. up, hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. down, hl.dsp.focus({ direction = "down" }))

-- Move window
hl.bind(mainMod .. " + SHIFT + " .. left, hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + " .. down, hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + " .. up, hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + " .. right, hl.dsp.window.move({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(mainMod .. " + bracketleft", function()
	local gapsIn = hl.get_config("general.gaps_in")
	local gapsOut = hl.get_config("general.gaps_out")
	hl.config({ general = {
		gaps_in = gapsIn.top + 10,
		gaps_out = gapsOut.top + 10,
	} })
end)

hl.bind(mainMod .. " + bracketright", function()
	local gapsIn = hl.get_config("general.gaps_in")
	local gapsOut = hl.get_config("general.gaps_out")
	hl.config({
		general = {
			gaps_in = math.max(0, gapsIn.top - 10),
			gaps_out = math.max(0, gapsOut.top - 10),
		},
	})
end)

-- Set all gaps to 0
hl.bind(mainMod .. " + G", function()
	hl.config({ general = { gaps_out = 0, gaps_in = 0 } })
end)

-- Set all gaps to 4
hl.bind(mainMod .. " + P", function()
	hl.config({ general = { gaps_out = 4, gaps_in = 4 } })
end)
