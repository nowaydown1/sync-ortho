# Ortho4XP X-Plane Sync Script

## Purpose

This is a Windows batch script I wrote to maintain junctions (symlinks) between my Ortho4XP and X-Plane install. Normally after generating a tile with Ortho4XP, you must copy the resulting `Tiles/zOrtho4XP_+44-148` style folder and the
`yOrtho4XP_Overlays` folder to the custom scenery directory within your X-Plane install. By using this script you can leave the files in your Ortho4XP directory and trick X-Plane into thinking that they exist in your custom scenery folder (`C:\X-Plane 11\Custom Scenery\zOrtho4XP_+44-148`). 

The advantage to this is that you have your main X-Plane install and your Ortho4XP install on separate hard drives.  In my case, X-Plane lives on my SSD, and all my ortho scenery lives on a much larger non-SSD hard drive.

Under the hood, all this script does it take the legwork out of you having to go and create these links by hand every time you change something. It scans the Tiles directory of your Ortho4XP install when you run it and creates any links that need to be created so that your X-Plane directory has a link to every `zOrtho4XP_` folder that exists in your Ortho4XP install.

## Requirements

* Windows
* X-Plane 11 / 10
* Ortho4XP

## Installation

To install this is simply download the sync-ortho.bat file and save it in `C:\X-Plane 11` (or whatever directory is your main X-Plane folder).  Assuming that your X-Plane install is `C:\X-Plane 11`, the final path should be `C:\X-Plane 11\sync-ortho.bat`.  

## Usage

Open your X-Plane 11 folder and **right click** on the `sync-ortho.bat` file you saved earlier.  From the right click menu, click on Edit.  This will open the script in an editor.

![Orthosync Configuration File](http://christophermckinney.net/github/orthosync/ConfigFile.png)

Change the XPlaneInstallDirectory and Ortho4XPDirectory settings to match the particulars of your installation.  Save the file and close it.

To run the script, simply double click on the `sync-ortho.bat` file in your X-Plane directory.  The script will look at both your Ortho4XP and X-Plane install and create the necessary links between the two.  The script will also link the `yOrtho4XP_Overlays` directory for you as well.

![Orthosync Script Running](http://christophermckinney.net/github/orthosync/ScriptRun.png)

You can re-run the script anytime you need to the links to be re-synchronized.  You won't hurt anything by running it.  If a link already exists, it will simply be skipped over and nothing will be done.  If a link is missing, one will be created for you.

If for some reason you would like to remove the links that were created by this script, simply open your Custom Scenery directory in your X-Plane installation and delete the `zOrtho4XP` folders.  Links created by this script show up with a little shortcut arrow in front of the folder to indicate that it's a link and not an actual folder.  Deleting these links **will not** remove the underyling ortho data.