------------------
-- MONITORS
------------------

hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@120",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

------------------
-- PROGRAMS
------------------

local terminal = "kitty"
local fileManager = "nautilus"
local menu = "wofi --show drun"

------------------
-- ENVIRONMENT
------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

------------------
-- LOOK AND FEEL
------------------

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,

		border_size = 0,

		col = {
			active_border = {
				colors = {
					"rgba(33ccffee)",
					"rgba(00ff99ee)",
				},
				angle = 45,
			},

			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,

		bezier = {
			"easeOutQuint, 0.23, 1, 0.32, 1",
			"easeInOutCubic, 0.65, 0.05, 0.36, 1",
			"linear, 0, 0, 1, 1",
			"almostLinear, 0.5, 0.5, 0.75, 1",
			"quick, 0.15, 0, 0.1, 1",
		},

		animation = {
			"global, 1, 7, default",
			"border, 1, 4, easeOutQuint",
			"windows, 1, 3.5, easeOutQuint",
			"windowsIn, 1, 3.2, easeOutQuint, popin 87%",
			"windowsOut, 1, 1.2, linear, popin 87%",
			"fadeIn, 1, 1.3, almostLinear",
			"fadeOut, 1, 1.1, almostLinear",
			"fade, 1, 2.5, quick",
			"layers, 1, 3, easeOutQuint",
			"layersIn, 1, 3.2, easeOutQuint, fade",
			"layersOut, 1, 1.2, linear, fade",
			"fadeLayersIn, 1, 1.5, almostLinear",
			"fadeLayersOut, 1, 1.2, almostLinear",
			"workspaces, 1, 1.5, almostLinear, fade",
			"workspacesIn, 1, 1, almostLinear, fade",
			"workspacesOut, 1, 1.5, almostLinear, fade",
			"zoomFactor, 1, 6, quick",
		},
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = 1,
		disable_hyprland_logo = true,
	},
})

------------------
-- INPUT
------------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},
	},
})

------------------
-- XWAYLAND
------------------

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

------------------
-- GESTURES
------------------

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

------------------
-- AUTOSTART
------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd(terminal)
end)

------------------
-- KEYBINDS
------------------

local mainMod = "SUPER"

------------------
-- APPLICATIONS
------------------

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("brave"))

hl.bind(mainMod .. " + C", hl.dsp.window.close())

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

------------------
-- FOCUS
------------------

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

------------------
-- WORKSPACES
------------------

local workspaceKeys = {
	A = 1,
	S = 2,
	D = 3,
	F = 4,
	["5"] = 5,
	["6"] = 6,
	["7"] = 7,
	["8"] = 8,
	["9"] = 9,
	["0"] = 10,
}

for key, workspace in pairs(workspaceKeys) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))

	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

------------------
-- WORKSPACE SCROLL
------------------

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

------------------
-- MOUSE
------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

------------------
-- MEDIA / BRIGHTNESS
------------------

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

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
