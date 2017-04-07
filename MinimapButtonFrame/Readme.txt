Minimap Button Frame Readme


Installation is the same as most other WoW addons.  Simply unpack the file to your    Worldofwarcraft/Interface/Addons   directory.


This addon gathers up all of your minimap addon buttons and puts them into a movable frame.

To Add a button not automatically gathered: Put your mouse over the button you want to add and type < /mbf add >.  
Will not work on unnamed buttons.  Can also use a key binding.
To Remove a button from the frame: put your mouse over the button and type < /mbf remove >.  A key binding can also be used.
It will return to it's previous spot and not be gathered next time.  You can set it to be gathered again by using < /mbf add > on it.

Blizzard minimap buttons that are not always visible (Battleground, LFG) will only appear on the frame when they are normally shown.
If Active Scanning is off they will not be gathered unless you do a < /mbf scan > while they are visible.

Commands:

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


History


0.9  - 	Initial Release
0.9a - 	Fixed - Squeenix compatability.
0.9b - 	Fixed - the reason for many of the addon buttons not populating.
0.9c - 	Added - A Minimap button for the Addon.  It can be hidden through the config screen.
	Added - an option to hide the frame background when the frame is locked.
	Fixed - an Incompatibility with FishingBuddy.
0.9d - 	Added - option to collect Blizzard Minimap Buttons. (Requested feature)
	Added - Tooltip to minimap icon.
	Fixed - Gatherer Incompatibility.
	Fixed - Minimap button reappearing bug.
	Fixed - Locked / Background hiding weird issue.
	Change - Metamap temporary hack.
	Change - Moved default position of the minimap button. (Left side instead of right, but won't affect anyone who's already moved it.)
	Change - Options screen shown with double click instead of middle Click on the minimap button. 
	Change - Code improvements in preparation of add / remove functionality.
1.0  -  Added - Add / Remove functionality Implemented.  
		- To Add: Put your mouse over the button you want to add and type /mbf add
		- To Remove a button from the frame: put your mouse over the button and type /mbf remove
	Fixed - Blizz Buttons return to their places when the option to gather them is unchecked.
1.1  -  Added - Option to collect the MBF Button.
	Fixed - Some parent frames not hidden.
	Fixed - Party Member Frames not protected.
	Fixed - ZoomIn and ZoomOut Buttons were always collected.
	Fixed - MBF Button could be turned off with the frame hidden.
	Fixed - Issue with buttons not displaying correctly when returned to the minimap.
1.2  -  Added - Background Color changeable from the config screen
	Added - Small Title Frame shown when unlocked for ease of dragging
	Fixed - Another FrameLevel Issue
	Fixed - RecipeRadar Incompatibility
1.2a -  Fixed - Background Hidden when locked coloring issue
1.3  -  Added - All Minimap buttons should be the same size
	Added - Title Frame now contains the version number of MBF
	Fixed - Title Frame is the same color as the background
	Fixed - Many small potental Incompatabilities and code enhancements
1.3a -  Added - Buttons now always displayed in Alphabetical order
	Added - Extra space between the frame edge and the buttons
	Fixed - Show & Collect MBF button bug
	Fixed - Monkey Buddy Minimap Button Incompatibility
1.4  -  Added - FuBar and Titan Bar Support
1.5  -	Added - Active Scanning Option
	Added - Setable Key Bindings
	Fixed - No more holes when buttons disappear
	Fixed - FuBar Plugin Error
1.6  -	Added - Greyed out version of the mail icon to be displayed when the mail icon isn't shown and Blizz buttons are gathered
	Added - Minimap Button will snap to the minimap when it gets close and roll around it
	Fixed - Mail Icon now added to the frame with the rest of the blizzard minimap buttons
	Fixed - Several small bugs
	Change - Tooltip display improved
1.7  -  Added - Multiple Sort Selections
	Added - Redesigned Options Screen
	Added - Ability to hide most of the Blizzard Minimap Icons
	Fixed - Bigfoot Incompatability (Bigfoot is partially incompatable with MBF)
	Fixed - Keybind Error
1.7a -  Change - TOC Update
	Fixed - Gathermate Incompatability
	Fixed - Locked Color Issues
	Fixed - Minimap Button being dragged offscreen
	Fixed - Notes Minimap Button Incompatability Fixed
1.8  -  Added - Localized in English, Spanish, French, and German (Quick translations.  ie Google translation)
	Added - Button to reset addon to defaults on the config screen
	Change - Show / Hide command line options restored
	Change - Active Scanning on by default now
	Change - Gathering functionality improved
	Change - Increased the number of max buttons on a row/column to 50
	Change - Pause Active Scanning during combat to help with tainting.
	Change - Addon will actively hide the blizzard buttons if the option to hide it is selected.  No reappearing mail icon.
	Change - Removed the gray no mail icon.  (If there is enough demand I'll add it back.)
	Fixed - An Issue with the blizz buttons not reappearing when the button was unclicked
1.8a -	Fixed - An Issue with GameTimeFrame
	Fixed - Incompatibilites with:
		EastWestPlus
		Natur EnemyCastBar 8.7.5
		ChinChilla
		SmartMinimapZoom
		HandyNotes
1.9  - 	Added - Support for minimap Shapes other than round
	Added - Option to turn off the gray no mail icon
	Added - Right Clicking on the Drag button will now hide / show the main frame.
	Change - Gray no mail icon restored (Okay only one request and I had missed it, but you can turn it off now.)
	Fixed - All buttons should return to their original size, frameStrata and frameLevel when removed
	Fixed - Incompatability with Trinity Bars
	Fixed - Incompatability with Xparky
1.9a -  Change - zhCN and zhTW localization added.  Thank you 急云@CWDG
	Change - Restored some old code dealing with blocking of Pins and Notes and such.  Should hopefully fix many new incompatabilities that were discovered.
	Fixed - Incompatability with BasicMinimap
	Fixed - Incompatability with Notes
	Fixed - Incompatability with CT_RaidAssist
	
1.10 Backported to vanilla
	 + update TOC
	 + added ruRU locale
	 + minor fixes
1.10a	
	+ fix MiniMapTrackingFrame error
	+ fix some interaddon compatibility, dont use such names:  "minimapButton"
1.10b
        + fixed finally MiniMapTrackingFrame error	
	
1.10c
        + Added ItemSync compatibility
	+ Added DPSMate button to default auto include, if it not gathering by MBF use /mbf add command
	
1.10d
        + Separate FuBar plugin (need translation of locales differ enUS and ruRU)

1.10e
        + Added support for EVTCalendar
	
Known Incompatibilities / Bugs

	The MetaMap minimap button is incompatable because of the continual reseting of its position by the MetaMap addon.

	The addon is unable grab minmap buttons that do not have a name.
	Currently discovered addons that are this way are:

		CT Mod		( For information on how to fix that see the CT_Mod fix text file included in the addon package. )
		Enchantrix 	( I have had a change request in with the developers for a while.  I don't think they're going to fix this. )


Future Features

	Ability to choose the order the buttons are displayed in.  (v. 2.0)

	Ability to change the shape of the buttons (round, square) (v. 2.0)

	Display minimap buttons on a fubar / titanbar addon.	   (will be a seperate addon that I'll start work on after v. 2.0 is finished)