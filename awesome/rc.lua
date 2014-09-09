-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
require("vicious")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

-- Load Debian menu entries
require("debian.menu")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
 beautiful.init("/home/korney/.config/awesome/space.lua")
--beautiful.init("theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,		--1
    awful.layout.suit.tile,		--2
    awful.layout.suit.tile.left,	--3
    awful.layout.suit.tile.bottom,	--4
    awful.layout.suit.tile.top,		--5
    awful.layout.suit.fair,		--6
    awful.layout.suit.fair.horizontal,	--7
    awful.layout.suit.spiral,		--8
    awful.layout.suit.spiral.dwindle,	--9
    awful.layout.suit.max,		--10
    awful.layout.suit.max.fullscreen,	--11	
    awful.layout.suit.magnifier		--12
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.

--tags = {
--   names  = { "main"," www ", " chat ",  "docs", "office", "games", "music", "virt", 9 }
--   layout = { awful.layout.suit.tile.bottom, awful.layout.suit.max, layouts[2], awful.layout.suit.max,awful.layout.suit.max,
--              layouts[2], layouts[2], awful.layout.suit.max, awful.layout.suit.tile.bottom
-- }


tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "main",     " www ",     " chat ",  "docs",      "dev",    "games",    "graphics",   "virt",     9 }, s,
   			{  layouts[7],layouts[10], layouts[3],layouts[10],layouts[10],layouts[11], layouts[1],layouts[10], layouts[2]  })


end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Debian", debian.menu.Debian_menu.Debian },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
	-- graphics cpu widget
	--cpugraphwidget = widget({ type = 'graph', name = 'cpugraphwidget', align = 'right' })
	--cpugraphwidget.height = 0.85
	--cpugraphwidget.height = 0.95
	--cpugraphwidget.width = 40
	--cpugraphwidget.bg = '#000022'
	--cpugraphwidget.border_color = '#0a0a0a'
	--cpugraphwidget.grow = 'left'
	--cpugraphwidget:plot_properties_set('cpu', { fg = '#60ff60', fg_center = '#50e050', fg_end = '#40d040', vertical_gradient = false })
	--wicked.register(cpugraphwidget, wicked.widgets.cpu, '$1', 1, 'cpu')
    -- Create a taglist widget

--ICONS-------------------------------------

baticon = widget({ type = "imagebox" })
baticon.image = image(beautiful.bat)

cpuicon = widget({ type = "imagebox" })
cpuicon.image = image(beautiful.proc)

memicon = widget({ type = "imagebox" })
memicon.image = image(beautiful.ram)

uptimeicon = widget({ type = "imagebox" })
uptimeicon.image = image(beautiful.uptime)
--

-- Separator and Spacer ---------------------------------------------------------

spacer = widget({ type = "textbox"})
separator = widget({ type = "textbox"})
spacer.text = " "
separator.text = " :: "

---------------------------------------------------------------------------------
batwidget = widget({type = "textbox"})
--  batwidget:set_width(8)
--  batwidget:set_height(10)
--  batwidget:set_vertical(true)
--  batwidget:set_background_color("#494B4F")
--  batwidget:set_border_color(nil)
--  batwidget:set_color("#AECF96")
--  batwidget:set_gradient_colors({ "#AECF96", "#88A175", "#FF5656" })
  vicious.register(batwidget, vicious.widgets.bat, "$1 $2%", 61, "BAT0")
  
-----------------------------------------------
uptimewidget = widget({ type = "textbox" })
  vicious.register(uptimewidget, vicious.widgets.uptime,
    function (widget, args)
      return string.format("%2dd %02d:%02d ", args[1], args[2], args[3])
    end, 61)

-- CPU Widget -------------------------------------------------------------------
    cpuwidget = widget({ type = "textbox" })
    vicious.register(cpuwidget, vicious.widgets.cpu, "<span color=\"#ffd700\"> $1% </span>")

---------------------------------------------------------------------------------
-- Create an fswidget -----------------------------------------------------------

fswidget = widget({ type = "textbox" })
vicious.register(fswidget, vicious.widgets.fs, "<span color=\"#92b7bf\"> /home <span color=\"#ffd700\">${/home avail_gb} GB</span>    </span>", 37)
 
---------------------------------------------------------------------------------

-- Create a memwidget -----------------------------------------------------------

memwidget = widget({ type = "textbox" , align="left"})
vicious.register(memwidget, vicious.widgets.mem, "<span color=\"#a5be94\"><span color=\"#ffd700\">$2/$3</span> MB</span> ", 13)

---------------------------------------------------------------------------------
-- Create a widget fi-----------------------------------------------------------

--wifiwidget = widget({ type = "textbox" , align="left"})
netwidget = widget({ type = "textbox" , align="left"})
vicious.register(netwidget, vicious.widgets.net,'<span color=\"#a5be94\">$wlan0:<span color=\"#ffd700\">${wlan0 down_kb} / ${wlan0 up_kb}</span></span>', nil, nil, 3)


-- Volume widget ----------------------------------------------------------------

--   tb_volume = widget({ type = "textbox", name = "tb_volume", align = "right" })
--   tb_volume:buttons(awful.util.table.join(
--	  awful.button({ }, 4, function () volume("up", tb_volume) end),
--	  awful.button({ }, 5, function () volume("down", tb_volume) end)
--	  ))
--   volume("update", tb_volume)

---------------------------------------------------------------------------------


mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
    mywibox[s] = awful.wibox({ position = "bottom", screen = s , align = "left"})
    mywibox[s].widgets = {

    fswidget,
    separator,
    cpuicon,cpuwidget,
    separator,
    memicon,memwidget,
    spacebar,
    separator,baticon,batwidget,
    separator,
    uptimeicon,uptimewidget,
    netwidget,
    layout = awful.widget.layout.horizontal.leftright,
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
    -- Lock screen
    awful.key({ modkey,           }, "l", function () awful.util.spawn("xscreensaver-command -lock") end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true , tag = tags[1][7] } },
    -- Set Firefox to always map on tags number 2 of screen 1.
     { rule = { class = "Firefox" },
       properties = { tag = tags[1][2] } },
     
     { rule = { class = "Steam" },
       properties = { tag = tags[1][6] } },

     { rule = { class = "Google-chrome" },
       properties = { tag = tags[1][2] } },

     { rule = { class = "Skype" },
       properties = { tag = tags[1][3] } },

     { rule = { class = "Evince" },
       properties = { tag = tags[1][4] } },

     { rule = { class = "OpenOffice.org 3.2" },
       properties = { tag = tags[1][4] } },
     { rule = { class = "LibreOffice" },
       properties = { tag = tags[1][4] } },

     { rule = { class = "VirtualBox" },
       properties = { tag = tags[1][8] } },

     { rule = { class = "rdesktop" },
       properties = { tag = tags[1][9] } },
     
     { rule = { class = "Aptana Studio 3" },
       properties = { tag = tags[1][5] } },

     { rule = { name = "angband" },
       properties = { tag = tags[1][6] } },
     { rule = { name = "UFO:AI" },
       properties = { tag = tags[1][6] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
