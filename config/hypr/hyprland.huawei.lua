-- #######################################################################################
-- Hyprland Lua Config (>= 0.55)
-- Converted from legacy hyprlang format
-- #######################################################################################

-- ============================================================================
-- MONITORS
-- ============================================================================
hl.monitor({
	output = "eDP-1",
	mode = "preffered",
	position = "auto",
	scale = "auto",
})

-- ============================================================================
-- PROGRAMS
-- ============================================================================
local terminal = "alacritty"
local fileManager = "thunar"
local menu = "fuzzel"

-- ============================================================================
-- AUTOSTART
-- ============================================================================
hl.on("hyprland.start", function()
	hl.exec_cmd("hypridle")
	hl.exec_cmd("mako")
	hl.exec_cmd("owncloud")
	hl.exec_cmd("sleep 2 && keepassxc")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("waybar -c ~/.config/waybar/config-hypr.json -s ~/.config/waybar/style-hypr.css")
	hl.exec_cmd("hyprctl setcursor Adwaita 24")
	hl.exec_cmd("swaybg -i /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png -m fill")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP DISPLAY")
	hl.exec_cmd(
		"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE DISPLAY"
	)
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("blueman-applet")
end)

-- ============================================================================
-- ENVIRONMENT VARIABLES
-- ============================================================================
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("HYPRLAND_NO_SD_VARS", "1")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- ============================================================================
-- LOOK AND FEEL
-- ============================================================================
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 2,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 0.8,
		shadow = {
			enabled = false,
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
		enabled = true,
	},
	dwindle = {
		preserve_split = true,
		force_split = 0,
		smart_split = false,
	},
	master = {
		new_status = "master",
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = false,
	},
})

-- ============================================================================
-- ANIMATIONS
-- ============================================================================
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- ============================================================================
-- INPUT
-- ============================================================================
hl.config({
	input = {
		kb_layout = "us,ru",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:caps_toggle",
		kb_rules = "",
		repeat_rate = 45,
		repeat_delay = 300,
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
		},
	},
})

-- Per-device config
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

-- Gestures
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- ============================================================================
-- KEYBINDINGS
-- ============================================================================
local mainMod = "ALT"
local mod4 = "SUPER"

-- Basic binds
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("~/.config/hypr/scripts/power_menu.sh"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({}))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("networkmanager_dmenu"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.local/bin/record-script.sh"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("firefox"))
hl.bind(mod4 .. " + CTRL + 3", hl.dsp.exec_cmd("grimshot copy area"))
hl.bind(mod4 .. " + CTRL + 4", hl.dsp.exec_cmd("grim - | satty -f -"))

-- Window switcher (аналог swayr)
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.config/hypr/scripts/win_switch.sh"))

-- Toggle effects (Экономия батареи / Охлаждение)
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_effects.sh"))

-- Toggle touchpad
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-touchpad.sh"))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + SPACE", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + CTRL + SPACE", hl.dsp.window.move({ workspace = "e+0" }))

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move window with auto-split creation
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Preselect direction (Sway-style)
hl.bind(mainMod .. " + V", hl.dsp.layout("preselect d"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.layout("preselect r"))

-- Previous workspace
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "previous" }))

-- Clipboard manager
hl.bind(
	mainMod .. " + C",
	hl.dsp.exec_cmd(
		'cliphist list | fuzzel -i -d -w 60 -l 20 -p "Select an entry to copy it:" | cliphist decode | wl-copy'
	)
)
hl.bind(
	mainMod .. " + CTRL + X",
	hl.dsp.exec_cmd(
		'cliphist list | fuzzel -d -w 60 -l 20 -t cc9393ff -S cc9393ff -p "Select an entry to delete it:" | cliphist delete'
	)
)

-- Multimedia keys
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -ud 2"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -ui 2"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer --toggle-mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true })
hl.bind("XF86KbdBrightnessUp", hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set +33%"))
hl.bind("XF86KbdBrightnessDown", hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set 33%-"))

-- Playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- ============================================================================
-- WINDOW RULES
-- ============================================================================
-- Suppress maximize events
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix XWayland dragging issues
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Hyprland-run window rule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = { 20, "monitor_h-60" },
	float = true,
})

-- Firefox -> workspace 2
hl.window_rule({
	name = "open-firefox-workspace2",
	match = { class = "firefox" },
	workspace = "2",
	float = false,
})

-- Telegram -> workspace 3
hl.window_rule({
	name = "open-tg-workspace3",
	match = { class = "org.telegram.desktop" },
	workspace = "3",
	float = false,
})

-- Mattermost -> workspace 5
hl.window_rule({
	name = "open-mm-workspace5",
	match = { class = "mattermost-desktop" },
	workspace = "5",
	float = false,
})
