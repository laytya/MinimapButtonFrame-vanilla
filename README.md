# Minimap Button Frame Vanilla
 
 
 ![Imgur](http://i.imgur.com/Tkf3gaa.jpg) ![Imgur](http://i.imgur.com/Kn2r6R5.jpg)
 
![options](https://github.com/laytya/MinimapButtonFrame-vanilla/assets/20452393/6391d50c-c52d-4b37-bb5e-cd10a90d93e0)
 
 One more example of using MBF
 
 ![image](https://github.com/laytya/MinimapButtonFrame-vanilla/assets/20452393/3ceef591-8190-41db-8ed9-6d2d26a81230)

 
This addon gathers up all of your minimap addon buttons and puts them into a movable frame.

To Add a button not automatically gathered: Put your mouse over the button you want to add and type < /mbf add >.  
Will not work on unnamed buttons.  Can also use a key binding.
To Remove a button from the frame: put your mouse over the button and type < /mbf remove >.  A key binding can also be used.
It will return to it's previous spot and not be gathered next time.  You can set it to be gathered again by using < /mbf add > on it.

Blizzard minimap buttons that are not always visible (Battleground, LFG) will only appear on the frame when they are normally shown.
If Active Scanning is off they will not be gathered unless you do a < /mbf scan > while they are visible.


# Basic install instructions

- Extract the archive
- Copy "MinimapButtonFrame" folder into your "\<WOW FOLDER>/Interface/Addons/" directory
- Optionaly (if you have FuBar) copy "MinimapButtonFrameFu" folder into your "\<WOW FOLDER>/Interface/Addons/" directory  


# Commands:

   /mbf        - displays the command line options in the chat frame
   /mbf add    - adds a non gathered button under the mouse to the frame
   /mbf remove - removes a gathered button under the mouse from the frame
   /mbf show   - shows the Main MBF Frame
   /mbf hide   - hides the Main MBF Frame
   /mbf info   - shows information about the object under the cursor
   /mbf scan   - performs a manual scan for minimap buttons
   /mbf config - shows the configuration screen
   /mbf help   - shows command help and information

Minimap Button:

<Left-click>           - to show / hide the frame and all the buttons.
<Shift-click>          - to show the config screen.
<Right-click> and drag - to move the minimap button anywhere.


# History
v1.11

+ Added Auto Hide functionality
+ Added TWoW buttons
+ some fixes
  
1.10e

+ Added support for EVTCalendar

1.10d

+ Separate FuBar plugin (need translation of locales differ enUS and ruRU)

1.10c

+ Added ItemSync compatibility
+ Added DPSMate button to default auto include, if it not gathering by MBF use /mbf add command

1.10b

+ fixed finally MiniMapTrackingFrame error	

1.10a	

+ fix MiniMapTrackingFrame error
+ fix some interaddon compatibility, dont use such names:  "minimapButton"	

1.10

+ Backported to vanilla
+ update TOC
+ added ruRU locale
+ minor fixes
	
# Download
[Download HERE](https://github.com/laytya/MinimapButtonFrame-vanilla/releases/latest)


# Credits

Originaly made by Bachlott
