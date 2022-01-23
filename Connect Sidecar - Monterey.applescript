use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

set deviceName to "My iPad" -- Change this to the name of your iPad.
set controlCenterName to "Control Center" -- Change this according to your language
set connectToSidecarName to "Connect to Sidecar" -- Change this according to your language
set disconnectSidecarName to "Disconnect" -- Change this according to your language

tell application "System Events"
	tell its application process "ControlCenter"
		-- Click the Control Center menu.
		click menu bar item controlCenterName of menu bar 1
		
		-- Give the window time to draw.
		delay 1
		
		-- Get all of the checkboxes in the Control Center menu.
		set ccCheckboxes to name of (every checkbox of window controlCenterName)
		
		
		if ccCheckboxes contains connectToSidecarName then
			-- If one of the checkboxes is named "Connect to Sidecar," click that checkbox.
			set sidecarToggle to checkbox connectToSidecarName of window controlCenterName
			click sidecarToggle
			
			-- This opens a secondary window that contains the button to actually connect to Sidecar. Give the window time to draw.
			delay 1
			
			-- In masOS Monterey, the Sidecar device toggle (checkbox) is inside of a scroll area.
			-- Rather than assume that it's in scroll area 1, get all of the scroll areas, loop through them, and find the device toggle.
			set scrollAreas to (every scroll area of window controlCenterName)
			set saCounter to 1
			set displayCheckboxes to ""
			
			repeat with sa in scrollAreas
				set displayCheckboxes to name of (every checkbox of sa)
				
				if displayCheckboxes contains deviceName then
					-- Device toggle found.
					exit repeat
				end if
				
				-- We didn't find the device toggle. Try the next scroll area.
				set saCounter to saCounter + 1
			end repeat
			
			if displayCheckboxes contains deviceName then
				-- If we found the a checkbox with the iPad's name, `saCounter` tells us which scroll area contains the Sidecar toggle.
				set deviceToggle to checkbox deviceName of scroll area saCounter of window controlCenterName
				
				-- Click the toggle to connect Sidecar.
				click deviceToggle
				
				-- Click the Control Center menu to close the secondary menu and return to the main menu.
				click menu bar item controlCenterName of menu bar 1
				
				-- Click the Control Center menu again to close the main menu.
				click menu bar item controlCenterName of menu bar 1
			else
				-- Sidecar is available, but no devices with deviceName were found.
				display dialog "The device " & deviceName & " can't be found. Please verify the name of your iPad and update the `deviceName` variable if necessary."
			end if
		else
			-- A checkbox named "Connect to Sidecar" wasn't found.
			set isConnected to false
			repeat with cb in ccCheckboxes
				-- Loop through the checkboxes and determine if Sidecar is already connected.
				if cb contains disconnectSidecarName then
					-- If one of the checkboxes has "Disconnect" in its name, Sidecar is already connected.
					-- Break out of the loop.
					set isConnected to true
					exit repeat
				end if
			end repeat
			
			if isConnected is equal to true then
				-- Click the checkbox to disconnect Sidecar.
				set sidecarToggle to ((checkbox 1 of window controlCenterName) whose name contains disconnectSidecarName)
				click sidecarToggle
				
				-- Click the Control Center menu again to close the main menu.
				click menu bar item controlCenterName of menu bar 1
			else
				-- Sidecar isn't connected, and no devices are available to connect to. Show an error message.
				display dialog "No Sidecar devices are in range."
			end if
		end if
	end tell
end tell
