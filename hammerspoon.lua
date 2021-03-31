local mash = {"cmd", "alt", "ctrl"}
local cmdc = {"ctrl", "cmd"}
local cmds = {"shift", "cmd"}
local ca = {"ctrl", "alt"}


-- switch keyboard layout

hs.hotkey.bind({}, "F16", function()
    hs.keycodes.currentSourceID("com.apple.keylayout.US")
end)

hs.hotkey.bind({}, "F17", function()
    hs.keycodes.currentSourceID("org.sil.ukelele.keyboardlayout.cyrillic- normal.russian-normal")
end)

hs.hotkey.bind({}, "F18", function()
    hs.keycodes.currentSourceID("org.sil.ukelele.keyboardlayout.cyrillic- normal.ukrainian-normal")
end)


-- switch apps

hs.hotkey.bind({"cmd"}, "1", function()
    -- hs.application.launchOrFocus("Brave Browser")
    hs.application.launchOrFocus("Google Chrome")
    -- hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind({"cmd"}, "2", function()
    hs.application.launchOrFocus("Terminal")
end)

hs.hotkey.bind({"cmd"}, "3", function()
    hs.application.launchOrFocus("emacs")
    -- hs.application.launchOrFocus("IntelliJ IDEA CE")
end)

hs.hotkey.bind({"cmd"}, "4", function()
    hs.application.launchOrFocus("Slack")
    -- hs.application.launchOrFocus("Zulip")
end)

hs.hotkey.bind({"cmd"}, "5", function()
    hs.application.launchOrFocus("FirefoxDeveloperEdition")
end)


hs.hotkey.bind({"cmd"}, "6", function()
    hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind({"cmd"}, "8", function()
    -- hs.application.launchOrFocus("Google Play Music Desktop Player")
    -- hs.application.launchOrFocus("Music")
    -- hs.application.launchOrFocus("Deezer")
    hs.application.launchOrFocus("Spotify")
end)

hs.hotkey.bind({"cmd", "shift"}, "8", function()
    hs.application.launchOrFocus("iTunes")
end)

hs.hotkey.bind({"cmd"}, "9", function()
    hs.application.launchOrFocus("Telegram")
end)
