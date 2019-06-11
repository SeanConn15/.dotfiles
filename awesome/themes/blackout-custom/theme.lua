---------------------------
-- Sean's awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font          = "Noto Mono for Powerline 11"
theme.name         = "blackout-custom"
theme.dir = string.format("%s/.config/awesome/themes/%s", os.getenv("HOME"), theme.name)

-- setting color values for gruvbox dark
theme.dark        = "#282828"
theme.dark0       = "#32302f"
theme.dark1       = "#3c3836"
theme.dark2       = "#504945"
theme.dark3       = "#665c54"
theme.dark4       = "#7c6f64"

theme.gray_245    = "#928374"

theme.light0      = "#f2e5bc"
theme.light1      = "#ebdbb2"
theme.light2      = "#d5c4a1"
theme.light3      = "#bdae93"
theme.light4      = "#a89984"

theme.red     = "#fb4934"
theme.green   = "#b8bb26"
theme.yellow  = "#fabd2f"
theme.blue    = "#83a598"
theme.purple  = "#d3869b"
theme.aqua    = "#8ec07c"
theme.orange  = "#fe8019"


-- menubar colors
theme.bg_normal     = theme.dark1
theme.bg_focus      = theme.dark1
theme.bg_urgent     = theme.red
theme.bg_minimize   = theme.dark0
theme.bg_systray    = theme.bg_normal

-- menubar font colors
theme.fg_normal     = theme.light4
theme.fg_focus      = theme.light1
theme.fg_urgent     = theme.light1
theme.fg_minimize   = theme.dark2

-- text for tasklist items
theme.tasklist_fg_normal = theme.light4
theme.tasklist_fg_focus  = theme.light0


-- Help screen colors/font
theme.hotkeys_font = theme.font
theme.hotkeys_description_font = "Noto Mono for Powerline 10"
theme.hotkeys_bg   = theme.light2
theme.hotkeys_fg   = theme.dark2
theme.hotkeys_label_fg = '#000000'
theme.hotkeys_modifiers_fg = theme.dark0
theme.hotkeys_border_width = 2
theme.hotkeys_border_color = theme.light4



-- calendar popup colors
theme.calendar_normal_bg_color = theme.dark1
theme.calendar_normal_fg_color = theme.light2


theme.calendar_focus_bg_color = theme.light1
theme.calendar_focus_fg_color = theme.dark1

theme.calendar_weekday_fg_color = theme.light2
theme.calendar_weekday_bg_color = theme.dark1

theme.calendar_header_fg_color = theme.light2
theme.calendar_header_bg_color = theme.dark1

theme.useless_gap   = dpi(7)
theme.border_width  = dpi(2)
theme.border_normal = theme.light4
theme.border_focus  = theme.light0

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"


-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
theme.notification_max_width = 400
theme.notification_max_height = 100

theme.notification_bg = theme.bg0

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(40)
-- theme.menu_width  = dpi(500)




-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Generate taglist squares:
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)
-- Define the image to load, or the color 

theme.wallpaper = "/home/sean/Documents/hosaka.png"
-- theme.backcolor = "#504945"


theme.layout_cascadetile                        = theme.dir .. "/layouts/cascadetile.png"
theme.layout_centerwork                         = theme.dir .. "/layouts/centerwork.png"
theme.layout_cornerne                           = theme.dir .. "/layouts/cornerne.png"
theme.layout_cornernw                           = theme.dir .. "/layouts/cornernw.png"
theme.layout_cornerse                           = theme.dir .. "/layouts/cornerse.png"
theme.layout_cornersw                           = theme.dir .. "/layouts/cornersw.png"
theme.layout_dwindle                            = theme.dir .. "/layouts/dwindle.png"
theme.layout_fairh                              = theme.dir .. "/layouts/fairh.png"
theme.layout_fairv                              = theme.dir .. "/layouts/fairv.png"
theme.layout_floating                           = theme.dir .. "/layouts/floating.png"
theme.layout_fullscreen                         = theme.dir .. "/layouts/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/layouts/magnifier.png"
theme.layout_max                                = theme.dir .. "/layouts/max.png"
theme.layout_spiral                             = theme.dir .. "/layouts/spiral.png"
theme.layout_tile                               = theme.dir .. "/layouts/tile.png"
theme.layout_tilebottom                         = theme.dir .. "/layouts/tilebottom.png"
theme.layout_tileleft                           = theme.dir .. "/layouts/tileleft.png"
theme.layout_tiletop                            = theme.dir .. "/layouts/tiletop.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Papirus-Dark"

return theme
