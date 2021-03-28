use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

set deviceName to "My iPad" -- Change this to the name of your iPad.

tell application "System Events"
	tell its application process "ControlCenter"
		-- Click the Control Center menu.
		click menu bar item "Control Center" of menu bar 1
		
		-- Give the window time to draw.
		delay 1
		
		-- Get all of the checkboxes in the Control Center menu.
		set ccCheckboxes to title of (every checkbox of group 1 of group 1 of window "Control Center")
		
		if ccCheckboxes contains "Connect to Sidecar" then
			-- If one of the checkboxes is named "Connect to Sidecar," click that checkbox.
			set sidecarToggle to checkbox "Connect to Sidecar" of group 1 of group 1 of window "Control Center"
			click sidecarToggle
			
			-- This opens a secondary window that contains the button to actually connect to Sidecar. Give the window time to draw.
			delay 1
			
			-- Get all of the checkboxes in the secondary menu.
			set displayCheckboxes to title of (every checkbox of group 1 of group 1 of window "Control Center")
			
			if displayCheckboxes contains deviceName then
				-- If one of the checkboxes has the same name as the iPad (`deviceName`), click that checkbox to connect to Sidecar.
				set deviceToggle to checkbox deviceName of group 1 of group 1 of window "Control Center"
				click deviceToggle
				
				-- Click the Control Center menu to close the secondary menu and return to the main menu.
				click menu bar item "Control Center" of menu bar 1
				
				-- Click the Control Center menu again to close the main menu.
				click menu bar item "Control Center" of menu bar 1
			end if
		else
			repeat with cb in ccCheckboxes
				if cb contains "Disconnect" then
					-- If one of the checkboxes has "Disconnect" in its name, Sidecar is already connected.
					-- Click the checkbox to disconnect Sidecar.
					set sidecarToggle to ((checkbox 1 of group 1 of group 1 of window "Control Center") whose title contains "Disconnect")
					click sidecarToggle
					
					-- Click the Control Center menu again to close the main menu.
					click menu bar item "Control Center" of menu bar 1
				end if
			end repeat
		end if
	end tell
end tell