# Connect Sidecar
Connect Sidecar is a script that connects your Mac to [Sidecar](https://support.apple.com/en-us/HT210380). If your Mac is already connected to Sidecar, the script will disconnect it.

The script is written in AppleScript. It uses [UI scripting](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/AutomatetheUserInterface.html) to click the Sidecar button in the correct menu (*Displays* in Catalina or *Control Center* in Bug Sur). The primary advantage of the script is that you can assign a keyboard shortcut to it (for example, using [Keyboard Maestro](https://www.keyboardmaestro.com/main/) or [FastScripts](https://redsweater.com/fastscripts/)). You can then connect or disconnect using the keyboard shortcut rather than clicking the menu item.

## Setup
For Big Sur, save [this file](https://github.com/geofftaylor/connect-sidecar/raw/main/Connect%20Sidecar%20-%20Big%20Sur.applescript). For Catalina, save [this file](https://github.com/geofftaylor/connect-sidecar/raw/main/Connect%20Sidecar%20-%20Catalina.applescript).

After you save the file, open it in Script Editor. (Script Editor is located in `/Applications/Utilities`.) Go to this line:

`set deviceName to "My iPad" -- Change this to the name of your iPad.`

Change `"My iPad"` to the name of your iPad, make sure it's enclosed in quotation marks, and save the file. (You can find your iPad's name under **Settings** > **General** > **About** > **Name**.)

## Usage
There are many ways you could use the script; here are a few options.

### Script Menu
Save the file in your user scripts folder (`/Users/<your username>/Library/Scripts`), and it will be available in the [Script Menu](https://support.apple.com/guide/script-editor/access-scripts-using-the-script-menu-scpedt27975/mac).

### Keyboard Maestro
Create a macro with an *Execute AppleScript* action. Copy and paste the code into the action, then assign a keyboard shortcut.

### FastScripts
Save the file in your user scripts folder (`/Users/<your username>/Library/Scripts`), then assign a keyboard shortcut in FastScript's preferences.