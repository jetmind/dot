-- switch keyboard layout

hs.hotkey.bind({}, "F16", function()
	hs.keycodes.currentSourceID("com.apple.keylayout.US")
end)

hs.hotkey.bind({}, "F17", function()
	hs.keycodes.currentSourceID("org.sil.ukelele.keyboardlayout.cyrillic- normal.ukrainian-normal")
	-- hs.keycodes.currentSourceID("org.sil.ukelele.keyboardlayout.cyrillic- normal.russian-normal")
end)

hs.hotkey.bind({}, "F18", function()
	hs.keycodes.currentSourceID("org.sil.ukelele.keyboardlayout.cyrillic- normal.ukrainian-normal")
end)

-- switch apps

hs.hotkey.bind({ "cmd" }, "1", function()
	-- hs.application.launchOrFocus("Brave Browser")
	-- hs.application.launchOrFocus("Google Chrome")
	-- hs.application.launchOrFocus("Safari")
	hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind({ "cmd" }, "2", function()
	hs.application.launchOrFocus("Alacritty")
	-- hs.application.launchOrFocus("Terminal")
	-- hs.application.launchOrFocus("Warp")
	-- hs.application.launchOrFocus("Kitty")
end)

hs.hotkey.bind({ "cmd" }, "3", function()
	-- hs.application.launchOrFocus("Zed")
	hs.application.launchOrFocus("emacs")
	-- hs.application.launchOrFocus("Sublime Text")
	-- hs.application.launchOrFocus("IntelliJ IDEA CE")
	-- hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind({ "cmd" }, "4", function()
	-- hs.application.launchOrFocus("Slack")
	hs.application.launchOrFocus("Microsoft Teams")
	-- hs.application.launchOrFocus("Zulip")
end)

hs.hotkey.bind({ "cmd" }, "5", function()
	hs.application.launchOrFocus("Sublime Text")
	-- hs.application.launchOrFocus("Firefox")
	-- hs.application.launchOrFocus("FirefoxDeveloperEdition")
end)

hs.hotkey.bind({ "cmd" }, "6", function()
	hs.application.launchOrFocus("Zed")
	-- hs.application.launchOrFocus("DBeaver")
	-- hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind({ "cmd" }, "7", function()
	hs.application.launchOrFocus("Obsidian")
end)

hs.hotkey.bind({ "cmd" }, "8", function()
	-- hs.application.launchOrFocus("Google Play Music Desktop Player")
	-- hs.application.launchOrFocus("Music")
	-- hs.application.launchOrFocus("Deezer")
	hs.application.launchOrFocus("Spotify (old)")
end)

hs.hotkey.bind({ "cmd", "shift" }, "8", function()
	hs.application.launchOrFocus("iTunes")
end)

hs.hotkey.bind({ "cmd" }, "9", function()
	hs.application.launchOrFocus("Telegram")
end)

-- open zoom links in zoom
hs.urlevent.httpCallback = function(scheme, host, params, fullURL)
	if string.find(fullURL, "^https://[%a%d%u.]*zoom%.us/[jw]/") then
		hs.urlevent.openURLWithBundle(fullURL, "us.zoom.xos")
	else
		hs.urlevent.openURLWithBundle(fullURL, "org.mozilla.firefox")
	end
end

-- kill annoying anyconnect popup
function closeAnyconnectPopup(window, appName, eventName)
	hs.timer.doAfter(1, function()
		window:focus()
		local button = { x = window:topLeft().x + 350, y = window:topLeft().y + 125 }
		-- print(hs.inspect(button))
		hs.eventtap.leftClick(button)
	end)
end

local wf = hs.window.filter
awf = wf.new(false):setAppFilter("Finder", { allowTitles = "Cisco AnyConnect Secure Mobility Client" })
awf:subscribe(wf.windowCreated, closeAnyconnectPopup, true)
