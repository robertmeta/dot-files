hs.hotkey.alertduration = 0
hs.window.animationduration = 0

-- spotify
hs.hotkey.bind('alt', 'left',function()hs.spotify.previous()end)
hs.hotkey.bind('alt', 'right',function()hs.spotify.next()end)
hs.hotkey.bind('alt', 'down',function()hs.spotify.playpause()end)

hs.hotkey.bind('cmd', 'return',function()
    hs.eventtap.event.newKeyEvent({'cmd'}, 'space', true):post()
    hs.eventtap.event.newKeyEvent({'cmd'}, 'space', false):post()
end)

hs.hotkey.bind('control', 'v',function()
    hs.eventtap.event.newKeyEvent({'cmd'}, 'v', true):post()
    hs.eventtap.event.newKeyEvent({'cmd'}, 'v', false):post()
end)

-- cmd-s is easier and built in
-- expose_space = hs.expose.new(nil,{includeotherspaces=true, showthumbnails=false}) -- only windows in the current mission control space
-- hs.hotkey.bind('alt', 'a',function()expose:toggleshow()end)
hs.hotkey.bind('cmd', 't', function()
    if hs.application.find("iTerm") then
        hs.applescript.applescript([[
            tell application "iTerm"
            create window with default profile
            end tell
        ]])
    else
        hs.application.open("iTerm")
    end
end)
