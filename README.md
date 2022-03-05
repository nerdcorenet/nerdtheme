# nerdtheme

This is a collection of various theming ingredients to reduce paddings, margins, borders, drop shadows, and other styles which obstruct the UI and are otherwise just eye candy.

Simply execute `./install.sh` and the CSS for gnome-shell, gtk-3.0, and FireFox will be deployed. Both gnome-shell and FireFox require additional configurations to enable nerdtheme, as described below:

## gnome-shell

Tweaks have been made to gnome-shell in order to reduce the vertical spacing of the topbar (Activities menu, Clock, Universal Access menu, Settings menu, etc).

To install:

Ensure that you have these packages installed (check your distribution for specific package names):
* gnome-tweak-tool
* gnome-shell-extensions

Then launch the “Tweaks” app from the application launcher and go to the “Extensions” tab in the sidebar. Enable the “User Themes” extension. Be sure that the “Extensions” toggle is enabled at the top. Now you can select "Nerdtheme" under Appearance > Shell

## GTK 3.0

I have modified an existing dark slim theme (Pocillo-dark-slim) to reduce vertical margins in various places, especially headerbars and titlebars. Extra vertical padding and margins have been reduced or entirely removed from titlebar icons. Drop shadows and custom icons have been removed. Everything is much more tight in the vertical dimension using nerdtheme.

The gtk-3.0/gtk.css file will be installed automagically by the install script `./install.sh`.

## FireFox

Theme tweaks for FireFox web browser are also included, which similarly reduce the vertical spacing in the Tab Bar, URL Bar, and Bookmarks Bar.

After executing `./install.sh` you will additionally need to perform the following steps manually in order to enable nerdtheme tweaks for FireFox:

1. Open FF and type "about:config" into the URL bar, and press Enter.
1. Accept the warning.
1. Set `toolkit.legacyUserProfileCustomizations.stylesheets = True`

## A Word About Designers...

I argued for hours with the GNOME Design Team in #gnome-design on irc.gnome.org while preparing nerdtheme.

They all believe that reducing vertical margins will make the UI unusable. They are high on drugs. It will work fine.

For some odd reason, designers don't understand CHOICE and insist that you must operate your computer in the way they have intended, even if it interferes with the operation of your computer for your own needs. They demand you must waste vertical screen space for extra paddings and margins and fancy rounded borders, even if you dislike them.

I have a visual disability and require Large Fonts and a light-on-dark theme to operate my computer efficiently. I do not, however, require 6px of vertical margin around everything to read the text in a window titlebar: 1px is fine for me. And while I understand the margins help touchscreen users immensely, I'm using a mouse cursor and I do not have motor control issues (yet!). Maybe some day I will want large margins again, but that day is not today.

By reducing vertical margins in places like the gnome-shell topbar and window titlebars, I've effectively saved a lot of screen real estate! No longer will extra margins obstruct my background windows, and all windows will now benefit from additional Content Area!

![Sample of nerdtheme wasting fewer vertical pixels](nerdtheme-saves-px.png "Nerdtheme Saves Pixels")
