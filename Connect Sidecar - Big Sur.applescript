use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

on writeToLog(message, theLogFile)
	try
		set theLogFile to theLogFile as string
		
		set openLogFile to open for access file theLogFile with write permission
		
		write message & "

" to openLogFile starting at eof
		
		close access openLogFile
		
		return true
		
	on error
		try
			close access file theLogFile
		end try
		
		return false
	end try
end writeToLog

on listToString(theList, theDelimiter)
	set saveDelimiters to AppleScript's text item delimiters
	set text item delimiters to theDelimiter
	set listText to theList as text
	set AppleScript's text item delimiters to saveDelimiters
	
	return listText
end listToString

set deviceName to "My iPad" -- Change this to the name of your iPad.

set currentDate to do shell script "date +'%Y%m%d-%H%M%S'"
set logFile to ((path to desktop folder) as string) & "connect-sidecar-" & currentDate & ".log"

set ccCheckboxes to {"none"}
set displayCheckboxes to {"none"}
set sidecarToggleOnName to "none"
set sidecarToggleOffName to "none"
set sidecarFound to "none"

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
			set sidecarFound to true
			set sidecarToggleOn to checkbox "Connect to Sidecar" of group 1 of group 1 of window "Control Center"
			set sidecarToggleOnName to name of sidecarToggleOn
			click sidecarToggleOn
			
			-- This opens a secondary window that contains the button to actually connect to Sidecar. Give the window time to draw.
			delay 1
			
			-- Get all of the checkboxes in the secondary menu.
			set displayCheckboxes to title of (every checkbox of group 1 of group 1 of window "Control Center")
			
			-- Click the Control Center menu to close the secondary menu and return to the main menu.
			click menu bar item "Control Center" of menu bar 1
			
			-- Click the Control Center menu again to close the main menu.
			click menu bar item "Control Center" of menu bar 1
		else
			set sidecarFound to false
		end if
	end tell
end tell

writeToLog("deviceName: " & deviceName, logFile)

set ccString to "ccCheckboxes: " & listToString(ccCheckboxes, "; ")
writeToLog(ccString, logFile)

writeToLog("sidecarFound: " & (sidecarFound as string), logFile)
writeToLog("sidecarToggleOnName: " & sidecarToggleOnName, logFile)
writeToLog("sidecarToggleOffName: " & sidecarToggleOffName, logFile)

set displayString to "displayCheckboxes: " & listToString(displayCheckboxes, "; ")
writeToLog(displayString, logFile)