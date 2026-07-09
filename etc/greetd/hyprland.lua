-- hl.env("GTK_USE_PORTAL", "0")
-- hl.env("GDK_DEBUG", "no-portals")
-- hl.on("hyprland.start", function()
-- 	hl.exec_cmd("regreet; hyprctl dispatch 'hl.dsp.exit()'")
-- end)
hl.on("hyprland.start", function()
	-- Передаем ВСЕ переменные прямо в лоб процессу regreet, чтобы предотвратить белый флеш
	hl.exec_cmd(
		"env GTK_THEME=Adwaita-dark GTK_USE_PORTAL=0 GDK_DEBUG=no-portals regreet --config /etc/greetd/regreet.toml; hyprctl dispatch 'hl.dsp.exit()'"
	)
end)
hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		disable_hyprland_guiutils_check = true,
	},
})
