use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

set deviceName to "My iPad" -- Change this to the name of your iPad.

tell application "System Events"
	tell process "SystemUIServer"
		click (menu bar item 1 of menu bar 1 whose description contains "Displays")
		set displaymenu to menu 1 of result
		if ((menu item 1 where its name starts with deviceName) of displaymenu) exists then
			-- Not connected, so click the name of the device to connect.
			click ((menu item 1 where its name starts with deviceName) of displaymenu)
		else
			-- Connected, so click "Disconnect" to disconnect.
			click ((menu item 1 where its name starts with "Disconnect") of displaymenu)
		end if
	end tell
end tell