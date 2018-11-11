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
    hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind({"cmd"}, "2", function()
    hs.application.launchOrFocus("Terminal")
end)

hs.hotkey.bind({"cmd"}, "3", function()
    hs.application.launchOrFocus("emacs")
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
    hs.application.launchOrFocus("iTunes")
end)

hs.hotkey.bind({"cmd"}, "9", function()
    hs.application.launchOrFocus("Telegram Desktop")
end)



--- Window management

hs.window.animationDuration = 0

local resize = function(sizechange)
    return function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        sizechange(f, max)
        win:setFrame(f)
    end
end

hs.hotkey.bind(cmds, "m", resize(function(f, max)
        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
end))

hs.hotkey.bind(mash, "left", resize(function(f, max)
        f.x = max.x
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
end))

hs.hotkey.bind(mash, "right", resize(function(f, max)
        f.x = max.x + (max.w / 2)
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
end))

hs.hotkey.bind(mash, "up", resize(function(f, max)
        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h / 2
end))

hs.hotkey.bind(mash, "down", resize(function(f, max)
        f.x = max.x
        f.y = max.y + (max.h / 2)
        f.w = max.w
        f.h = max.h / 2
end))
