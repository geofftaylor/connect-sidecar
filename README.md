**Note: I'm no longer updating this script, so I've archived the repository. I don't use it anymore, and it's too difficult to keep up with the changes to Control Center in each macOS release. I'm glad so many of you found it useful.**

# Connect Sidecar
Connect Sidecar is a script that connects your Mac to [Sidecar](https://support.apple.com/en-us/HT210380). If your Mac is already connected to Sidecar, the script will disconnect it.

The script is written in AppleScript. It uses [UI scripting](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/AutomatetheUserInterface.html) to click the Sidecar button in the correct menu (*Displays* in Catalina or *Control Center* in Bug Sur). The primary advantage of the script is that you can assign a keyboard shortcut to it (for example, using [Keyboard Maestro](https://www.keyboardmaestro.com/main/) or [FastScripts](https://redsweater.com/fastscripts/)). You can then connect or disconnect using the keyboard shortcut rather than clicking the menu item.

## Setup
Download the latest zip file from [this page](https://github.com/geofftaylor/connect-sidecar/releases/latest). Extract the files from the archive. Select the `.applescript` file that is appropriate for your version of macOS (Monterey, Big Sur or Catalina).

Open the script in Script Editor. (Script Editor is located in `/Applications/Utilities`.) Go to this line:

`set deviceName to "My iPad" -- Change this to the name of your iPad.`

Change `"My iPad"` to the name of your iPad, make sure it's enclosed in quotation marks, and save the file. (You can find your iPad's name under **Settings** > **General** > **About** > **Name**.)

Save the script in your user scripts folder (`/Users/<your username>/Library/Scripts`) or another location of your choosing.

## Usage
There are many ways you could use the script; here are a few options.

### Script Menu
If you saved the script in your user scripts folder (`/Users/<your username>/Library/Scripts`), it will be available in the [Script Menu](https://support.apple.com/guide/script-editor/access-scripts-using-the-script-menu-scpedt27975/mac).

### Keyboard Maestro
Create a macro with an *Execute AppleScript* action. Set the action to *Execute script file* and enter the path to the script in the *Script file* box. Then assign a keyboard shortcut.

### FastScripts
If you saved the script in your user scripts folder (`/Users/<your username>/Library/Scripts`), it will be available in the FastScripts menu, and you can assign a keyboard shortcut in FastScript's preferences.

## Notes
* This script will probably break with each major version of macOS. It may break with minor versions as well.
* I'll attempt to update the script when new macOS versions are released, but it may take some time.