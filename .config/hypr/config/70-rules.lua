hl.window_rule({
	-- Fix some dragging issues with XWayland
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

hl.window_rule({
	match = { class = "UnrealEditor", title = "^\\w*$" },
	no_initial_focus = true,
	no_anim = true,
	min_size = "400 700",
})

hl.window_rule({
	name = "float-bluetooth",
	match = { class = "^(blueman-manager)$" },
	float = true,
	size = "400 400",
	center = true,
})

hl.window_rule({
	name = "float-rider-welcome",
	match = { class = "^(jetbrains-rider)$", title = "^(Welcome to JetBrains Rider)$" },
	float = true,
	size = "600 600",
	center = true,
})
