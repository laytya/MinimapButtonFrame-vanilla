local version = GetAddOnMetadata("MinimapButtonFrame", "Version");
local time = 0;
MBF_timeToHide = -1;
local scanned = false;
local paused = false;
local MBF_ButtonInfoStorage = {};
local MBF_ChildEventStorage = {};
local MBF_Sorted = {};

local _, build , _ = GetBuildInfo()
local tWOW  = tonumber(build) > 6000

local oldParentName;
local oldPoint;
local oldRelativeTo;
local oldRelativePoint;
local oldXofs;
local oldYofs;
local oldOnEvent;
local oldOnDragStart;
local oldOnDragStop;
local oldName;
local oldFrameLevel;
local oldWidth;
local oldHeight;
local oldScale;
local oldLevel;
local oldStrata;

local padding = 5;
local columns_or_rows = 3;
local addonScale = .8;
local debug = false;
local opacity = 1;
local sort_by_rows = false;
local locked = false;
local colorLocked = "Nothing";
MBFminimapButton = true;
mbfHidden = false;
local grabBlizzButtons = false;
grabMBFButton = false;
local colorOpacity = 1;
local MBFBackdropColor = { 0, 0, 0 }
activeScanning = true;
sortOrder = "Alpha"
local disabledMail = true;
local rollUp = false;
local autoHide = false;

MBFHideMiniMapTrackingFrame = false;
MBFHideMiniMapVoiceChatFrame = false;
MBFHideMiniMapWorldMapButton = false;
--MBFHideMiniMapMeetingStoneFrame = false;
MBFHideMinimapZoomIn  = false;
MBFHideMiniMapMailFrame = false;
--MBFHideMiniMapBattlefieldFrame = false;
MBFHideGameTimeFrame = false;

local MinimapShapes = {
	-- LowerRight, LowerLeft, UpperRight, UpperLeft
	-- true = rounded, false = squared
	["ROUND"] 			= {true, true, true, true},
	["SQUARE"] 			= {false, false, false, false},
	["CORNER-TOPLEFT"] 		= {false, false, false, true},
	["CORNER-TOPRIGHT"] 		= {false, false, true, false},
	["CORNER-BOTTOMLEFT"] 		= {false, true, false, false},
	["CORNER-BOTTOMRIGHT"]	 	= {true, false, false, false},
	["SIDE-LEFT"] 			= {false, true, false, true},
	["SIDE-RIGHT"] 			= {true, false, true, false},
	["SIDE-TOP"] 			= {false, false, true, true},
	["SIDE-BOTTOM"] 		= {true, true, false, false},
	["TRICORNER-TOPLEFT"] 		= {false, true, true, true},
	["TRICORNER-TOPRIGHT"] 		= {true, false, true, true},
	["TRICORNER-BOTTOMLEFT"] 	= {true, true, false, true},
	["TRICORNER-BOTTOMRIGHT"] 	= {true, true, true, false},
}

local BlizzButtons = { "MiniMapTrackingFrame", "MiniMapMeetingStoneFrame", "MinimapZoomIn", "MinimapZoomOut", "MiniMapMailFrame", "MiniMapBattlefieldFrame", "GameTimeFrame" };
local BlizzUI = { "ActionBar", "BonusActionButton", "MainMenu", "ShapeshiftButton", "MultiBar", "KeyRingButton", "PlayerFrame", "TargetFrame", "PartyMemberFrame", "ChatFrame", "ExhaustionTick", "TargetofTargetFrame", "WorldFrame", "ActionButton", "CharacterMicroButton", "SpellbookMicroButton", "TalentMicroButton", "QuestLogMicroButton", "SocialsMicroButton", "LFGMicroButton", "HelpMicroButton", "CharacterBag", "PetFrame",  "MinimapCluster", "MinimapBackdrop", "UIParent", "WorldFrame", "Minimap", "BuffButton", "BuffFrame", "TimeManagerClockButton" };
local UserUIProtected = { "TitanPanel", "AutoBarButton", "FuBarFrame", "RicoMinimap_CoordinatesFrame", "MinimapZoom", "MinimapButtonFrame", "Xparky", "MBFRestoreButton", "BasicMiniMap", "CT_RASetsFrame", "simpleMinimapFrame",};
local MinimapIcons = { "Note", "JQuest", "Naut_", "MinimapIcon", "GatherMatePin", "WestPointer", "Chinchilla_", "SmartMinimapZoom","QuestieNote", "smm", "FishingExtra","pfMiniMapPin","Spy_" };
local ParentStop = { "WorldFrame", "Minimap", "MinimapBackdrop", "UIParent", "MinimapCluster", "CECBMiniMapButtonFrame", "CT_RASetsFrame", "simpleMinimapFrame" };

MBF_Default_Ignore = { "MetamapButton" };
MBF_Default_Include = { "DPSMate_MiniMap","EVTButtonFrame"};

if tWOW then
	MBF_Default_Include = { "DPSMate_MiniMap","EVTButtonFrame", "MinimapShopFrame", "TWMiniMapBattlefieldFrame","LFTMinimapButton", "EBC_Minimap"};
end

MBF_FrameLocation = { "CENTER", "CENTER", 0, 0 };
MBF_Vars = { 5, 3, .8, false, 1, false, false, "Nothing", true, false, false, false, 1, { 0, 0, 0}, true, "Alpha", false, false, false, false, false, false, true, false, false };

local initMBF_Vars = MBF_Vars;
local initMBF_FrameLocation = MBF_FrameLocation;

-- Init and Event Handler Functions

--Code by Grayhoof (SCT)
local function CloneTable(t)				-- return a copy of the table t
	local new = {};					-- create a new table
	local i, v = next(t, nil);		-- i is an index of t, v = t[i]
	while i do
		if type(v)=="table" then 
			v=CloneTable(v);
		end 
		new[i] = v;
		i, v = next(t, i);			-- get next index
	end
	return new;
end

function MBF_OnLoad()
	SLASH_MBF1 = "/mbf";
	SLASH_MBF2 = "/minimapbuttonframe";
	SlashCmdList["MBF"] = function(msg)
		MBF_SlashCommandHandler(msg);
	end

	MinimapButtonFrame:RegisterEvent("ADDON_LOADED");
	MinimapButtonFrame:RegisterEvent("ADDON_ENABLED");
	MinimapButtonFrame:RegisterEvent("PLAYER_REGEN_DISABLED");
	MinimapButtonFrame:RegisterEvent("PLAYER_REGEN_ENABLED");
	MinimapButtonFrame:RegisterForDrag("LeftButton");
	MinimapButtonFrameDragButton:RegisterForClicks("RightButtonUp");
	MinimapButtonFrame:SetUserPlaced(false);
end

function MBF_OnUpdate(elapsed)

	time = time + elapsed; 
	if MBF_timeToHide >= 0 then
		MBF_timeToHide = MBF_timeToHide + elapsed;
	end
	if (paused == false) then
		if (scanned == false) then
			if (time > 3) then 
				MBF_Scan();
				scanned = true;
				MBF_timeToHide = 4;
				if mbfHidden then
					MinimapButtonFrame:Hide();
					MBF_timeToHide = -1;
				end
				if rollUp then
					MBFRestoreButton:Show();
					
				end
			end
		end
		if ((activeScanning) and (time > 1) and (scanned)) then
			MBF_Scan();
			time = 0;
		end
		if scanned and autoHide and MinimapButtonFrame:IsVisible() and MBF_timeToHide > 5 then
			MBF_timeToHide = -1;
			MinimapButtonFrame:Hide();
		end
	end
end
	
function fixNils()
	if (padding == nil) then 
		padding = 5 
	end;
	if (columns_or_rows == nil) then 
		columns_or_rows = 3 
	end;
	if (addonScale == nil) then 
		addonScale = .8
	end;
	local debug = false;
	if (opacity == nil) then
		opacity = 1;
	end;
	if (sort_by_rows == nil) then
		sort_by_rows = false;
	end;
	if (locked == nil) then
		locked = false;
	end;
	if (colorLocked == nil) then
		colorLocked = "Nothing";
	end
	if (MBFminimapButton == nil) then
		MBFminimapButton = true;
	end
	if (mbfHidden == nil) then
		mbfHidden = false;
	end
	if (grabBlizzButtons == nil) then
		grabBlizzButtons = false;
	end
	if (grabMBFButton == nil) then
		grabMBFButton = false;
	end
	if (colorOpacity == nil) then
		colorOpacity = 1;
	end
	if (MBFBackdropColor == nil) then
		MBFBackdropColor = { 0, 0, 0 };
	end
	if (activeScanning == nil) then
		activeScanning = false;
	end
	if (sortOrder == nil) then
		sortOrder = "Alpha";
	end
	if (disabledMail == nil) then
		disabledMail = true;
	end
	if (rollUp == nil) then
		rollUp = false;
	end
	if (autoHide == nil) then
		autoHide = false;
	end
	for k,v in ipairs(BlizzButtons) do
		if ((v ~= "MinimapZoomOut") and (v ~= "MiniMapBattlefieldFrame") and (v ~= "MiniMapMeetingStoneFrame")) then
			if (getglobal("MBFHide"..v) == nil) then
				setglobal("MBFHide"..v, false);
			end
		end
	end
end

function MBF_OnEvent()
	local bPoint;
	local bRelativeTo;
	local bRelativePoint;
	local bXofs;
	local bYofs;
	local red;
	local green;
	local blue;

	
	if ((event == "ADDON_LOADED") and (arg1 == "MinimapButtonFrame")) then	
		if (initMBF_Vars ~= MBF_Vars) then
			padding, columns_or_rows, addonScale, debug, opacity, sort_by_rows, locked, colorLocked, MBFminimapButton, mbfHidden, grabBlizzButtons, grabMBFButton, colorOpacity, MBFBackdropColor, activeScanning, sortOrder, MBFHideMiniMapTrackingFrame, MBFHideMiniMapVoiceChatFrame, MBFHideMiniMapWorldMapButton, MBFHideMinimapZoomIn, MBFHideMiniMapMailFrame, MBFHideGameTimeFrame, disabledMail, rollUp, autoHide = unpack(MBF_Vars);
			fixNils();			
			updateMBFVars();
		end
		if (MBF_Include == nil) then
			MBF_Include = CloneTable(MBF_Default_Include)
		end
		if (MBF_Ignore == nil) then
			MBF_Ignore = CloneTable(MBF_Default_Ignore)
		end
		if (initMBF_FrameLocation ~= MBF_FrameLocation) then
			setMBFLocation();
		end

		if ((disabledMail == true) and(MiniMapMailFrame:IsShown() == false) and (MBFHideMiniMapMailFrame == false) and (((grabBlizzButtons == true) and (isInTable(MBF_Ignore,"MiniMapMailFrame") == false)) or ((grabBlizzButtons == false) and (isInTable(MBF_Include,"MiniMapMailFrame") == true)))) then
			MiniMapMailFrameDisabled:Show();
			MiniMapMailFrameDisabled:SetFrameLevel(MinimapButtonFrame:GetFrameLevel()+1)
		end
		
		MBFC_KeepBlizzHidden();
		
		if (MBFminimapButton) then
			MBFMiniButtonFrame:Show();
		else
			MBFMiniButtonFrame:Hide();
		end

		if (locked) then
			MinimapButtonFrameDragButton:Hide();
		end

		if ((colorLocked == true) or (colorLocked == false)) then
			if (colorLocked == true) then
				colorLocked = "All";
			else
				colorLocked = "Nothing";
			end
		end
		
		MinimapButtonFrameDragButton:SetTextFontObject("GameFontNormal");
		MinimapButtonFrameDragButton:SetText("MBF " .. version);

		MBFRestoreButton:RegisterForClicks("RightButtonUp");
		MBFRestoreButton:SetTextFontObject("GameFontNormal");
		MBFRestoreButton:SetText("MBF " .. version);
		MBFRestoreButton:SetAlpha(opacity);
		MBFRestoreButton:SetScale(addonScale);
		
		MinimapButtonFrame:SetAlpha(opacity);
		MinimapButtonFrame:SetScale(addonScale);
		
		
		
		MBFC_ColorLocked();
	elseif (event == "PLAYER_REGEN_DISABLED") then
		paused = true;
		if (MBFC:IsVisible()) then
			MBFC_Toggle();
		end
		MBFButton:Disable();
		SetDesaturation(MBFButtonIcon, 1);
	elseif (event == "PLAYER_REGEN_ENABLED") then
		paused = false;
		MBFButton:Enable();
		SetDesaturation(MBFButtonIcon, 0);
	end
end

function MBF_OnDragStart()
	if (locked == false) then
		MinimapButtonFrame:StartMoving();
		MinimapButtonFrame.isMoving = true;
		MBF_timeToHide = -1
	end
end

function MBF_OnDragStop()
	if (locked == false) then
		local bPoint;
		local bRelativeTo;
		local bRelativePoint;
		local bXofs;
		local bYofs;

		MinimapButtonFrame:StopMovingOrSizing();
		MinimapButtonFrame.isMoving = false;
		MinimapButtonFrame:SetUserPlaced(false);
		MinimapButtonFrame:SetFrameLevel(2);

		bPoint, bRelativeTo, bRelativePoint, bXofs, bYofs = MinimapButtonFrame:GetPoint();
		MBF_FrameLocation = { bPoint, bRelativePoint, bXofs, bYofs };
		MBF_timeToHide = 0
	end
end

function MBF_SlashCommandHandler(msg)
	local startPos
	local endPos
	local firstWord
	local restOfString

	startPos, endPos, firstWord, restOfString = strfind(msg, "(%w+)[%s%p]*(.*)");
	
	if (firstWord == nil) then
		firstWord = MBF_SLASH_Usage;
	end

	if (firstWord == MBF_SLASH_Usage) then
		printf(MBF_SLASH_Version .. " " .. version);
		printf(MBF_SLASH_Overview);
	end
	if (firstWord == MBF_SLASH_Info) then
		displayInfo(GetMouseFocus());
	end 
	if (firstWord == MBF_SLASH_Show) then
		MBFC_Visible(3);
	end
	if (firstWord == MBF_SLASH_Hide) then
		MBFC_Visible(4);
	end
	if (firstWord == MBF_SLASH_Scan) then
		MBF_Scan();
	end
	if (firstWord == MBF_SLASH_Help) then
		printf(MBF_SLASH_Detail1);
		printf(MBF_SLASH_Detail2);
		printf(MBF_SLASH_Detail3);
		printf(MBF_SLASH_Detail4);
		printf(MBF_SLASH_Detail5);
		printf(MBF_SLASH_Detail6);
		printf(MBF_SLASH_Detail7);
		printf(MBF_SLASH_Detail8);
		printf(MBF_SLASH_Detail9);
	end
	if (firstWord == MBF_SLASH_Debug) then
		ShowDebugValues(tonumber(restOfString));
	end 
	if (firstWord == MBF_SLASH_Config) then
		MBFC_Toggle();
	end
	if (firstWord == MBF_SLASH_Remove) then
		if (GetMouseFocus():GetName() ~= "WorldFrame") then
			removeButton(GetMouseFocus(), 0)
		end
	end
	if (firstWord == MBF_SLASH_Add) then
		includeButton(GetMouseFocus());
	end
	if (firstWord == MBF_SLASH_Sort) then
		toggleSort();
	end
	if (firstWord == "child") then
		printChildStorage();
	end
	if (firstWord == "storage") then
		printButtonStorage();
	end
	updateMBFVars()
end

-- Output Functions

function printf(text)
	if (text == nil) then
		text = "";
	end
	DEFAULT_CHAT_FRAME:AddMessage("|c1B4687FFMBF|r : " .. text);
end

function displayInfo(target)
	printf("-----------------------------");
	printf(format(target:GetName() or '(' .. MBF_UnnamedObject .. ')'));
	printf("-----------------------------");
	if (target:GetName() ~= "WorldFrame") then
		printf(MBF_Parent .. " : " .. format(target:GetParent():GetName() or '(' .. MBF_UnknownParentName .. ')'));
	else
		printf(MBF_Parent .. " : " .. MBF_NoParent);
	end 
	printf(MBF_ObjectType .. " : " .. format(target:GetObjectType() or '(' .. MBF_UnknownObjectType .. ')'));
	printf("-----------------------------");
end

function ShowDebugValues(typeCast)
	
	if ((typeCast == 1) or (typeCast == nil)) then
		printf("------------------");
		printf("MBF Children");
		printf("------------------");
		for k,v in ipairs({MinimapButtonFrame:GetChildren()}) do
			printf("Child(" .. k ..") : " .. format(v:GetName() or '(Unnamed Object)'));
			printf("Width : " .. v:GetWidth() .. " / Height " .. v:GetHeight());
		end
		printf("------------------");
	end
	if ((typeCast == 2) or (typeCast == nil)) then
		printf("------------------");
		printf("MBF Debug Values");
		printf("------------------");
		printf("GetNumChildren : " .. MinimapButtonFrame:GetNumChildren());
		printf("Columns / Rows : " .. columns_or_rows);
		printf("MBF Width      : " .. MinimapButtonFrame:GetWidth());
		printf("MBF Height     : " .. MinimapButtonFrame:GetHeight());
		if (sort_by_rows) then
			printf("sort_by_rows   : true");
		else
			printf("sort_by_rows   : false");
		end
		printf("Padding        : " .. padding);
		printf("Scale          : " .. addonScale);
		printf("Opacity        : " .. opacity);
		if (locked) then
			printf("Locked         : true");
		else
			printf("Locked         : false");
		end
		if (colorLocked) then
			printf("Frame Visible  : true");
		else
			printf("Frame Visible  : false");
		end
		if (MBFminimapButton) then
			printf("Button Visible : true");
		else
			printf("Button Visible : false");
		end
		if (grabBlizzButtons) then
			printf("Grab Blizz Buttons : true");
		else
			printf("Grab Blizz Buttons : false");
		end
		if (mbfHidden) then
			printf("Hidden         : true");
		else
			printf("Hidden         : false");
		end
		printf("------------------");
	end
	if ((typeCast == 3) or (typeCast == nil)) then
		printf("------------------");
		printf("Ignored");
		printf("------------------");
		for k,v in ipairs(MBF_Ignore) do
			printf(v);
		end
		printf("------------------");
		printf("Included");
		printf("------------------");
		for k,v in ipairs(MBF_Include) do
			printf(v);
		end
		printf("------------------");
	end
end

-- Utility Functions

function setMBFLocation()
	local bPoint;
	local bRelativePoint;
	local bXofs;
	local bYofs;

	bPoint, bRelativePoint, bXofs, bYofs = unpack(MBF_FrameLocation);

	MinimapButtonFrame:ClearAllPoints();
	MinimapButtonFrame:SetPoint(bPoint, UIParent, bRelativePoint, bXofs, bYofs);
	MinimapButtonFrame:SetFrameLevel(2);
	MinimapButtonFrame:SetUserPlaced(false);
end

isInTable = function(tab, frameName)
	for k,v in ipairs(tab) do
		if (strlower(v) == strlower(frameName)) then
			return true;
		end
	end
	return false;
end

isInStorage = function(buttonName)
	for k,v in pairs(MBF_ButtonInfoStorage) do
		oldName, oldParentName, oldFrameLevel, oldPoint, oldRelativeTo, oldRelativePoint, oldXofs, oldYofs, oldOnDragStart, oldOnDragStop, oldOnEvent, oldWidth, oldHeight, oldScale, oldLevel, oldStrata = unpack(v);

		if (oldName == buttonName) then
			return v;
		end
	end
	return -1;
end

isPartialMatch = function(frameName, tab)
	local result = false

	for k,v in ipairs(tab) do
		startpos, endpos = strfind(strlower(frameName), strlower(v))
		if (startpos == 1) then
			result = true;
		end
	end

	return result;
end

isBlizzButton = function(frameName)
	return isInTable(BlizzButtons, frameName);
end

getTopParent = function(frame) 
-- returns 1 for ParentStop parent, and 0 for MBF
	local result;
	local parentName
	if frame:GetParent() then 
		parentName = frame:GetParent():GetName(); 
	else
		return 1;
	end

	if (isInTable(ParentStop,parentName)) then 
		result = 1
	elseif (parentName == "MinimapButtonFrame") then
		result = 0
	else
		result = getTopParent(frame:GetParent());
	end
	
	return result;
end

isMinimapIcon = function(frame)
	local foundPos = 0;
	local frameName = strlower(frame);
	local result = false;

	for k,v in ipairs(MinimapIcons) do
		found = strfind(frameName,strlower(v),1);
		
		if (found) then
			if (frameName ~= "notesiconframe") then
				result = true;
			end
		end
	end

	return result;
end

isValidAdd = function(frame, autoGather)
	local result = true;
	local frameName = frame:GetName();
	if (frameName ~= nil) then
		if (frame:IsVisible()) then
			if (getTopParent(frame) == 1) then
				if (isPartialMatch(frameName, BlizzUI) or isInTable(UserUIProtected, frameName)) and not(isInTable(MBF_Default_Include,frameName)) then
					result = false;
				end

				if (isMinimapIcon(frameName)) then
					result = false;
				end

				if ((frameName == "MBFMiniButtonFrame") and (grabMBFButton == false)) then
					result = false;
				end

				if (autoGather) then
					if (isBlizzButton(frameName)) then
						if (grabBlizzButtons == true) then
							result = true;
						else
							result = false;
						end
					end
					if (isInTable(MBF_Ignore,frameName)) then
						result = false;
					end
				else
					if (isBlizzButton(frameName)) then
						if ((grabBlizzButtons == true) and (isInTable(MBF_Ignore,frameName))) then
							result = true;
						elseif (grabBlizzButtons == false) then
							result = true;
						end
					end
				end
			else
				result = false;
			end
		elseif (frameName == "MiniMapMailFrame") then
			if ((disabledMail == false) or (MBFHideMiniMapMailFrame == true) or ((grabBlizzButtons == false) and (isInTable(MBF_Include, frameName) == false)) or ((grabBlizzButtons == true) and (isInTable(MBF_Ignore, frameName) == true))) then
				result = false;
			end
		else
			result = false;
		end
	else
		result = false;
	end
	return result
end

isButtonFrame = function(frame)
	return (frame:IsFrameType("Frame"))
end

function removeFromTable(tab, buttonName)
	for k,v in ipairs(tab) do
		if (strlower(v) == strlower(buttonName)) then
			tremove(tab,k);
		end
	end
end

displayDisabledMail = function()
	-- Will return if the button should be shown
	local result = true;
	if ((disabledMail == false) or (MBFHideMiniMapMailFrame == true) or (MiniMapMailFrame:IsShown())) or ((grabBlizzButtons == true) and (isInTable(MBF_Ignore,"MiniMapMailFrame") == true)) or ((grabBlizzButtons == false) and (isInTable(MBF_Include,"MiniMapMailFrame") == false)) then
		result = false;
	end

	return result;
end

-- Button Gathering Functions

function findButtons(frame)
	for i, child in ipairs({frame:GetChildren()}) do
		if (child:GetName() == "CECBMiniMapButtonFrame") then
			child = CECBMiniMapButton;
		end
		if (isValidAdd(child, true)) then
			addButton(child);
		end
	end
end

function findIncluded()
	local button;
	for k,v in ipairs(MBF_Include) do
		button = getglobal(v);
		if (button ~= nil) then
			addButton(button);
		end
	end
end

function saveOldData(button)
	oldName = button:GetName();
	oldParentName = button:GetParent():GetName();
	oldFrameLevel = button:GetFrameLevel();
	oldPoint, oldRelativeTo, oldRelativePoint, oldXofs, oldYofs = button:GetPoint();
	oldOnDragStart = button:GetScript('OnDragStart');
	oldOnDragStop = button:GetScript('OnDragStop');
	oldOnEvent = button:GetScript('OnEvent');
	oldWidth = button:GetWidth();
	oldHeight = button:GetHeight();
	oldScale = button:GetScale();
	oldLevel = button:GetFrameLevel();
	oldStrata = button:GetFrameStrata();

	MBF_ButtonInfoStorage[button:GetName()] = { oldName, oldParentName, oldFrameLevel, oldPoint, oldRelativeTo, oldRelativePoint, oldXofs, oldYofs, oldOnDragStart, oldOnDragStop, oldOnEvent, oldWidth, oldHeight, oldScale, oldLevel, oldStrata };
end

function saveAndDisableChildScripts(button)
	local childName;
	local childParentName;
	local childOnDragStart;
	local childOnDragStop;
	local childOnEvent;

	for i, child in ipairs({button:GetChildren()}) do
		childName = child:GetName();
		childParentName = child:GetParent():GetName();
		childOnDragStart = child:GetScript('OnDragStart');
		childOnDragStop = child:GetScript('OnDragStop');
		childOnEvent = child:GetScript('OnEvent');

		MBF_ChildEventStorage[childName] = {childParentName, childName, childOnDragStart, childOnDragStop, childOnEvent};	

		child:SetScript('OnDragStart', nil);
		child:SetScript('OnDragStop', nil);
		
		if (isInTable(BlizzButtons, childName) == false) then
			child:SetScript('OnEvent', nil);
		end
	end
end

removeChildScriptStorageRow = function(buttonName)
	local childName;
	local childParentName;
	local childOnDragStart;
	local childOnDragStop;
	local childOnEvent;
	local loopVar = 1;
	local rowsToRemove = 0;
	local removeRows = {};
	local result = false;
	
	for k,v in pairs(MBF_ChildEventStorage) do
		childParentName, childName, childOnDragStart, childOnDragStop, childOnEvent = unpack(v);

		if(childParentName == buttonName) then
			rowsToRemove = rowsToRemove + 1;
			removeRows[rowsToRemove] = loopVar;
			result = true;
		end
		loopVar = loopVar + 1;
	end
	
	sort(removeRows, function(a,b) return a>b end);
	
	for k,v in ipairs(removeRows) do
		tremove(MBF_ChildEventStorage, v);
	end

	return result;
end

function restoreChildScripts(button)
	local childName;
	local childParentName;
	local childOnDragStart;
	local childOnDragStop;
	local childOnEvent;
	local buttonName = button:GetName();
	local success = false;

	for i, child in ipairs({button:GetChildren()}) do

		childParentName, childName, childOnDragStart, childOnDragStop, childOnEvent = unpack(MBF_ChildEventStorage[child:GetName()]);

		child:SetScript('OnDragStart', childOnDragStart);
		child:SetScript('OnDragStop', childOnDragStop);
		child:SetScript('OnEvent', childOnEvent);
	end
	
	success = removeChildScriptStorageRow(buttonName);

	if (success == false) then
		printf(MBF_ERR5 .. " : " .. buttonName);
	end
 end

function addButton(button)
	
	if button:GetParent() ~= MinimapButtonFrame then
		local buttonName = button:GetName();

		saveOldData(button);

		button:SetParent(MinimapButtonFrame)
		button:SetScript('OnDragStart', nil);
		button:SetScript('OnDragStop', nil);
		button.oenter = button:GetScript("OnEnter");
		button:SetScript("OnEnter", function()
			MBF_timeToHide = -1;
			if( this.oenter ) then
				this.oenter();
			end
		end);
		button.oleave = button:GetScript("OnLeave");
		button:SetScript("OnLeave", function()
			MBF_timeToHide = 0;
			if( this.oleave ) then
				this.oleave();
			end
		end);
		
		if (isButtonFrame(button)) then
			saveAndDisableChildScripts(button);
		end
		
		if (isBlizzButton(buttonName) == false) then
			button:SetScript('OnEvent', nil);
		end
		if (buttonName == "BigFootMinimapButton") then
			button:SetScript('OnShow', nil);
			button:SetFrameLevel(MinimapButtonFrame:GetFrameLevel()+1)
		end
		if ((buttonName == "MiniMapTrackingFrame") or (buttonName == "GameTimeFrame")) then
			button:SetWidth(36);
			button:SetHeight(36);
		end
		
		if (buttonName == "EVTButtonFrame") then
			EVTButtonFrame:SetWidth(33)
			EVTButtonFrame:SetHeight(33)
			EVTButton:SetScale(33/48)
		end
		
		if (buttonName =="SprocketMinimapButton") then
			SprocketMinimapButton:SetWidth(33)
			SprocketMinimapButton:SetHeight(33)
			SprocketMinimapButton:SetScale(33/48)
		end

		if (buttonName == "CensusButtonFrame")  then
			button:SetScript('OnEvent', nil);
		end
		
		if (buttonName == "ISync_MiniMapButtonFrame")  then
			ISync_MiniMapButton:SetPoint("TOPLEFT",ISync_MiniMapButtonFrame,"TOPLEFT",0,0)
			button.osetpoint = ISync_MiniMapButton.SetPoint --ISync.MiniMapButton_UpdatePosition
			ISync_MiniMapButton.SetPoint = function() end;
		end
		
		if (buttonName == "ABProfiles_IconFrame")  then
			ABProfilesButton:ClearAllPoints()
			ABProfilesButton:SetPoint("CENTER",0,0)
			ABProfilesButton:SetScale(0.8)
		end

		if (buttonName == "MonkeyBuddyIconButton") then
			button:SetWidth(33);
			button:SetHeight(33);
		end
		if (((button:GetHeight() > 33) or (button:GetHeight() < 33)) and  (buttonName ~= "AM_MinimapButton") and (buttonName ~= "EVTButtonFrame") ) then
			button:SetScale(33 / button:GetHeight());
		end
	end
end

restoreButtonSettings = function(button)
	local loopVar = 1;
	local buttonName = button:GetName();

	-- Load row and Remove from Storage
	for k,v in pairs(MBF_ButtonInfoStorage) do
		oldName, oldParentName, oldFrameLevel, oldPoint, oldRelativeTo, oldRelativePoint, oldXofs, oldYofs, oldOnDragStart, oldOnDragStop, oldOnEvent, oldWidth, oldHeight, oldScale, oldLevel, oldStrata = unpack(v);

		if(oldName==buttonName) then
			tremove(MBF_ButtonInfoStorage, loopVar);

			button:ClearAllPoints();
			button:SetPoint(oldPoint, oldRelativeTo, oldRelativePoint, oldXofs, oldYofs);
			button:SetParent(oldParentName);
			button:SetFrameLevel(oldFrameLevel);
			button:SetScript('OnDragStart', oldOnDragStart);
			button:SetScript('OnDragStop', oldOnDragStop);
			button:SetScript('OnEvent', oldOnEvent);
			button:SetScript("OnEnter",button.oenter);
			button:SetScript("OnLeave", button.oleave);

			button:SetWidth(oldWidth or 31);
			button:SetHeight(oldHeight or 31);
			button:SetScale(oldScale or 1);
			button:SetFrameLevel(oldLevel or 1);
			button:SetFrameStrata(oldStrata or "HIGH");

			if (button:GetNumChildren() > 0) then
				restoreChildScripts(button);
			end

			if (buttonName == "ISync_MiniMapButtonFrame")  then
				ISync_MiniMapButton.SetPoint = button.osetpoint
				ISync:MiniMapButton_UpdatePosition()
			end

			updatePositions();

			button:GetParent():Show();
			
			return true;
		else
			loopVar = loopVar + 1;
		end
	end
	return false;
end

function ClearMBF()
	for i, button in ipairs({MinimapButtonFrame:GetChildren()}) do
		removeButton(button, 1);
	end
end

function removeButton(button, clear)
	local success = false;
	local isBlizz = false;

	if (button:GetParent() == MinimapButtonFrame and (button:GetName() ~= "MinimapButtonFrameDragButton")) then

		if (button:GetName() == "MiniMapMailFrameDisabled") then
			button = MiniMapMailFrame;
			MiniMapMailFrameDisabled:Hide();
		elseif (button:GetName() == "MiniMapMailFrame") then
			MiniMapMailFrameDisabled:Hide();
		end

		success = restoreButtonSettings(button);
						
		if ((success) and (clear == 0)) then
			if (isInTable(MBF_Include, button:GetName())) then
				removeFromTable(MBF_Include, button:GetName());
			elseif (isInTable(MBF_Ignore, button:GetName()) == false) then
				isBlizz = isBlizzButton(button:GetName());
				if (((isBlizz and grabBlizzButtons) or (isBlizz == false)) and (button:GetName() ~= "MBFMiniButtonFrame")) then
					tinsert(MBF_Ignore, button:GetName());
				end 
			end
		elseif (success == false) then
			printf(MBF_ERR1 .. " : " .. button:GetName());
		end
	else
		if (isInTable(ParentStop, button:GetParent():GetName()) == true) then
			printf(MBF_ERR2 .. " : " .. button:GetName());
		elseif (button:GetName() ~= "MinimapButtonFrameDragButton") then 
			removeButton(button:GetParent(), clear);
		end
	end
end

function removeInvisible(button)
	local success = false;

	if ((button:GetParent() == MinimapButtonFrame) and (button:GetName() ~= "MinimapButtonFrameDragButton"))then
		success = restoreButtonSettings(button);
		if (success == false) then
			printf(MBF_ERR3 .. " : " .. button:GetName());
		end
	end
end

function removeBlizzButtons()
local button;
local mbfHide = mbfHidden;

	if (mbfHide == true) then
		MinimapButtonFrame:Show();
	end
	for k,v in pairs(BlizzButtons) do
		button = getglobal(v);
		if (button ~= nil) and (button:IsVisible()) and (isInTable(MBF_Ignore,v) == false) then
			removeButton(button, 0)
		elseif ((v == "MiniMapMailFrame") and (isInTable(MBF_Ignore,v) == false)) then
			removeButton(button, 0)
		end
	end
	if (mbfHide == true) then
		MinimapButtonFrame:Hide();
	end
end

function includeButton(button)
	local buttonName = button:GetName();
	local parentName;

	if (buttonName ~= "WorldFrame") then
		parentName = button:GetParent():GetName();
		if (isValidAdd(button,false)) then
			if (isInTable(ParentStop, parentName)) then
				if (isInTable(MBF_Ignore, buttonName)) then
					removeFromTable(MBF_Ignore, buttonName);
				else
					tinsert(MBF_Include, buttonName);
				end
				addButton(button);
				updatePositions();
			else
				includeButton(button:GetParent())
			end
		else
			printf(MBF_ERR4 .. " : " .. button:GetName().." not valid");
		end 
	else
		printf(MBF_ERR4 .. " : " .. button:GetName());
	end
end

local sortChildren = function()
	local Children = {};
	local Blizz = {};
	local buttonName;

	for i, button in ipairs({MinimapButtonFrame:GetChildren()}) do
		buttonName = button:GetName();
		if ((button:IsVisible()) or (mbfHidden)) then
			if (((sortOrder == "BlizzFirst") or (sortOrder == "BlizzLast")) and (isBlizzButton(buttonName))) then
				tinsert(Blizz, buttonName);
			else 
				tinsert(Children, buttonName);
			end
		else
			if (((buttonName ~= "MiniMapMailFrame") or (MBFHideMiniMapMailFrame == true) or (disabledMail == false)) and (buttonName ~= "MiniMapMailFrameDisabled")) then
				removeInvisible(button);
			elseif ((sortOrder == "BlizzFirst") or (sortOrder == "BlizzLast")) then
				if ((displayDisabledMail()) or (buttonName == "MiniMapMailFrame")) then
					tinsert(Blizz, buttonName);
				end
			else
				if ((displayDisabledMail()) or (buttonName == "MiniMapMailFrame")) then
					tinsert(Children, buttonName);
				end
			end
		end
	end
	sort(Blizz);
	sort(Children);
	if (sortOrder == "BlizzFirst") then
		for i, button in ipairs(Children) do
			tinsert(Blizz, button);
		end
		return Blizz;
	elseif (sortOrder == "BlizzLast") then
		for i, button in ipairs(Blizz) do
			tinsert(Children, button);
		end
		return Children;
	else	
		return Children;
	end
end

function updatePositions()
	
	MBFMiniButtonFrame:SetScale(addonScale*(1/Minimap:GetEffectiveScale()))
	
	local processMail = false;
	local childExceptions = 2
	
	local avgButtonSize = 33 + padding;
	local spacer = avgButtonSize / 2;
	local x = spacer + 5;
	local y = -spacer - 5;
	
	local crPad;
	local iterator = 1;

	local numChildrenRC = ceil((MinimapButtonFrame:GetNumChildren() - childExceptions) / columns_or_rows);
	local userSize = (columns_or_rows * avgButtonSize)
	local dynamicSize = (numChildrenRC * avgButtonSize)

	if (sort_by_rows) then
		MinimapButtonFrame:SetHeight(userSize + 10);
		MinimapButtonFrame:SetWidth(dynamicSize + 10);
	else
		MinimapButtonFrame:SetWidth(userSize + 10);
		MinimapButtonFrame:SetHeight(dynamicSize + 10);
	end		

	for i, buttonName in ipairs(sortChildren()) do

		button = getglobal(buttonName);
		if ((buttonName ~= "MinimapButtonFrameDragButton") and (button:GetName() ~= "MiniMapMailFrameDisabled")) then
			
			button:SetFrameStrata("MEDIUM");
			button:SetFrameLevel(MinimapButtonFrame:GetFrameLevel() + 1);
			if (isButtonFrame(button)) then
				for i, child in ipairs({button:GetChildren()}) do
					child:SetFrameLevel(button:GetFrameLevel() + 1)
				end
			end
			if ((mod(iterator-1,columns_or_rows) == 0) and iterator > 1) then
				if (sort_by_rows) then
					y = -spacer - 5;
					x = x + avgButtonSize;
				else
					y = y - avgButtonSize;
					x = spacer + 5;
				end
			end

			button:ClearAllPoints();
			
			if (button:GetScale() ~= 1) then
				button:SetPoint("CENTER", MinimapButtonFrame, "TOPLEFT", x + (x * (1 - button:GetScale())), y + (y * (1 - button:GetScale())));
			else
				button:SetPoint("CENTER", MinimapButtonFrame, "TOPLEFT", x, y);
			end
			
			if (sort_by_rows) then
				y = y - avgButtonSize;
			else
				x = x + avgButtonSize;
			end

			iterator = iterator + 1;
		
			if (buttonName == "MiniMapMailFrame") then
				MiniMapMailFrameDisabled:ClearAllPoints();
				MiniMapMailFrameDisabled:SetPoint(button:GetPoint());
				
				if button:IsShown() then
					MiniMapMailFrameDisabled:Hide();
					MiniMapMailFrameDisabled:SetFrameLevel(MiniMapMailFrame:GetFrameLevel()-1)
				elseif ((grabBlizzButtons == true) and (disabledMail == true)) then
					MiniMapMailFrameDisabled:Show();
					MiniMapMailFrameDisabled:SetFrameLevel(MiniMapMailFrame:GetFrameLevel()+1)
				end
			end
		elseif (button:GetName() == "MiniMapMailFrameDisabled") then
			if (displayDisabledMail()) then 
				MiniMapMailFrameDisabled:Show();
				MiniMapMailFrameDisabled:SetFrameLevel(MiniMapMailFrame:GetFrameLevel()+1)
			else
				MiniMapMailFrameDisabled:Hide();
				MiniMapMailFrameDisabled:SetFrameLevel(MinimapButtonFrame:GetFrameLevel()-1)
			end
		end
	end
end

function MBF_Scan()
	MBFC_KeepBlizzHidden();
	findButtons(Minimap);
	findButtons(MinimapBackdrop);
	scaleButtons(Minimap);
	scaleButtons(MinimapBackdrop);
	findIncluded();
	if isValidAdd(GameTimeFrame, true) then
		addButton(GameTimeFrame);
	end
	updatePositions();
	
end

function scaleButtons(frame)
	
	for i, child in ipairs({frame:GetChildren()}) do
		-- if (isValidAdd(child, true)) then
		--	addButton(child);
		-- end
		local frameName = child:GetName();
		if (frameName and isInTable(MBF_Ignore,frameName) and frameName ~= "MBFMiniButtonFrame") then
			child:SetScale(addonScale*(1/Minimap:GetEffectiveScale()));
		end
	end
end

-- Configuration Screen Functions --

function updateMBFVars()

	MBF_Vars = { padding, columns_or_rows, addonScale, debug, opacity, sort_by_rows, locked, colorLocked, MBFminimapButton, mbfHidden, grabBlizzButtons, grabMBFButton, colorOpacity, MBFBackdropColor, activeScanning, sortOrder, MBFHideMiniMapTrackingFrame, MBFHideMiniMapVoiceChatFrame, MBFHideMiniMapWorldMapButton, MBFHideMinimapZoomIn, MBFHideMiniMapMailFrame, MBFHideGameTimeFrame, disabledMail, rollUp };
end

function MBFC_Toggle ()
	if MBFC:IsVisible() then
		MBFC:Hide();
	else
		MBFC_Init();
		MBFC:Show();
	end
	updateMBFVars();
end

function MBFC_Visible(source, parentName) 
local activate = false;
	
	if (source == 1) then -- From MBF Minimap Button
		if (grabMBFButton == false) then
			activate = true;
		end
	elseif (source == 2) then -- From FuBar or Titan Plugin
		if (parentName ~= "MinimapButtonFrame") then
			activate = true;
		end
	elseif (source == 3) then -- Command Line Show
		if (mbfHidden == true) then
			activate = true;
		end	
	elseif (source == 4) then -- Command Line Hide
		if (mbfHidden == false) then
			activate = true;
		end
	end

	if (activate) then 
		if MinimapButtonFrame:IsVisible() then
			MinimapButtonFrame:Hide();
			mbfHidden = true;
			MBF_timeToHide = -1
		else
			MinimapButtonFrame:Show();
			mbfHidden = false;
			MBF_timeToHide = 0
		end
		updateMBFVars();
	end
end

function MBFC_KeepBlizzHidden()
	for k,v in ipairs(BlizzButtons) do
		if ((v ~= "MinimapZoomOut") and (v ~= "MiniMapBattlefieldFrame") and (v ~= "MiniMapMeetingStoneFrame")) then
			if (getglobal("MBFHide"..v) == true) then
				getglobal(v):Hide();
				if (v == "MiniMapMailFrame") then
					MiniMapMailFrameDisabled:Hide();	
				elseif (v == "MinimapZoomIn") then
					MinimapZoomOut:Hide();
				end
			end				
		end
	end
end

function MBFC_LockedToggle()
	if (locked) then
		locked = false
		MinimapButtonFrameDragButton:Show();
	else
		locked = true
		MinimapButtonFrameDragButton:Hide();
	end
	MBFC_ColorLocked();
	updateMBFVars();
end

function MBFC_AutohideToggle()
	if (autoHide) then
		autoHide = false
		if not mbfHidden then
			MinimapButtonFrame:Show();
			MBF_timeToHide = -1;
		end
	else
		autoHide = true
		MBF_timeToHide = 0;
	end
end

function MBFC_SortbyRowsToggle()
	if (sort_by_rows) then
		sort_by_rows = false;
	else
		sort_by_rows = true;
	end	
	updatePositions();
	updateMBFVars();
end

function MBFC_MinimapButtonToggle()
	if (MBFminimapButton) then
		MBFminimapButton = false;
		if (grabMBFButton) then
			removeButton(MBFButton, 0);
		end
		MBFMiniButtonFrame:Hide();
		MinimapButtonFrame:Show();
		MinimapButtonFrame:SetFrameLevel(2);
		mbfHidden = false;
	else
		MBFminimapButton = true;
		MBFMiniButtonFrame:Show();
		if (grabMBFButton) then
			MBF_Scan();
		end
		MinimapButtonFrame:SetFrameLevel(2);
	end
	updateMBFVars();
end

function MBFC_GrabBlizzButtonsToggle()
	if (grabBlizzButtons) then
		grabBlizzButtons = false;
		removeBlizzButtons();
	else
		grabBlizzButtons = true;
	end
	MBF_Scan();
	updateMBFVars();
end;

function MBFC_GrabMBFButtonToggle()
	if (grabMBFButton) then
		grabMBFButton = false;
		removeButton(MBFMiniButtonFrame, 0);
	else
		grabMBFButton = true;
		MinimapButtonFrame:Show();
		mbfHidden = false;
	end
	MBF_Scan();
	updateMBFVars();
end

function MBFC_SliderPaddingUpdate(newVal)
	padding = newVal;
	MBF_Scan();
	updateMBFVars();
end

function MBFC_SliderOpacityUpdate(newVal)
	opacity = newVal;
	MinimapButtonFrame:SetAlpha(opacity);
	MBFRestoreButton:SetAlpha(opacity);
	updateMBFVars();
end

function MBFC_SliderColumnsUpdate(newVal)
	columns_or_rows = newVal;
	MBF_Scan();
	updateMBFVars();
end

function MBFC_SliderScaleUpdate(newVal)
	addonScale = newVal;
	MinimapButtonFrame:SetScale(addonScale);
	MBFRestoreButton:SetScale(addonScale);
	updateMBFVars();
end

function MBFC_ColorOpacityUpdate(a)
	if ((locked == false) or (colorLocked ~= "All")) then
		local red;
		local green;
		local blue;

		red, green, blue = unpack(MBFBackdropColor);
		MinimapButtonFrame:SetBackdropColor(red, green, blue, a);
		MinimapButtonFrameDragButton:SetBackdropColor(red, green, blue, a);
		MBFRestoreButton:SetBackdropColor(red, green, blue, a);
	end
	colorOpacity = a;
	updateMBFVars();
end

function MBFC_ColorUpdate()
	local red;
	local green;
	local blue;

	red, green, blue = MBFCColorSelect:GetColorRGB();

	if ((locked == false) or (colorLocked ~= "All")) then
		MinimapButtonFrame:SetBackdropColor(red, green, blue, colorOpacity);
		MinimapButtonFrameDragButton:SetBackdropColor(red, green, blue, colorOpacity);
		MBFRestoreButton:SetBackdropColor(red, green, blue, colorOpacity);
	end
	MBFBackdropColor = { red, green, blue };
	updateMBFVars();
end

function MBFC_ActiveScanningToggle()
	if activeScanning then
		activeScanning = false;
	else
		activeScanning = true;
	end
	updateMBFVars();
end

function MBFC_DisabledMailToggle()
	if disabledMail then
		disabledMail = false;
	else
		disabledMail = true;
	end
	updateMBFVars();
end

function MBFCSort_Initialize()
	local info;

	info = {};
	info.text = MBF_DROPDOWN_Alpha;
	info.func = MBFCDropDownMenu_ReSort;
	UIDropDownMenu_AddButton(info);

	info.text = MBF_DROPDOWN_BlizzFirst;
	info.func = MBFCDropDownMenu_ReSort;
	UIDropDownMenu_AddButton(info);

	info.text = MBF_DROPDOWN_BlizzLast;
	info.func = MBFCDropDownMenu_ReSort;
	UIDropDownMenu_AddButton(info);

	if (sortOrder == "Alpha") then
		UIDropDownMenu_SetSelectedID(MBFCSortDropDown, 1);
	elseif (sortOrder == "BlizzFirst") then
		UIDropDownMenu_SetSelectedID(MBFCSortDropDown, 2);
	elseif (sortOrder == "BlizzLast") then
		UIDropDownMenu_SetSelectedID(MBFCSortDropDown, 3);
	end
end

function MBFCDropDownMenu_ReSort()
	local optionID = this:GetID();

	UIDropDownMenu_SetSelectedID(MBFCSortDropDown, optionID);
	if (optionID == 1) then
		sortOrder = "Alpha";
	elseif (optionID == 2) then
		sortOrder = "BlizzFirst";
	elseif (optionID == 3) then
		sortOrder = "BlizzLast";
	end
	updateMBFVars();
	updatePositions();
end 

function MBFCColorLocked_Initialize()
	local info;

	info = {};
	info.text = MBF_DROPDOWN_Nothing;
	info.func = MBFCDropDownMenu_Hide;
	UIDropDownMenu_AddButton(info);

	info.text = MBF_DROPDOWN_Border;
	info.func = MBFCDropDownMenu_Hide;
	UIDropDownMenu_AddButton(info);

	info.text = MBF_DROPDOWN_Background;
	info.func = MBFCDropDownMenu_Hide;
	UIDropDownMenu_AddButton(info);

	info.text = MBF_DROPDOWN_Both;
	info.func = MBFCDropDownMenu_Hide;
	UIDropDownMenu_AddButton(info);

	if (colorLocked == "Nothing") then
		UIDropDownMenu_SetSelectedID(MBFCColorLockedDropDown, 1);
	elseif (colorLocked == "Border") then
		UIDropDownMenu_SetSelectedID(MBFCColorLockedDropDown, 2);
	elseif (colorLocked == "Background") then
		UIDropDownMenu_SetSelectedID(MBFCColorLockedDropDown, 3);
	elseif (colorLocked == "All") then
		UIDropDownMenu_SetSelectedID(MBFCColorLockedDropDown, 4);
	end
end

function MBFC_ColorLocked() 
	local red;
	local green;
	local blue;
	
	red, green, blue = unpack(MBFBackdropColor);
	MinimapButtonFrameDragButton:SetBackdropColor(red, green,blue, colorOpacity);
	MBFRestoreButton:SetBackdropColor(red, green, blue, colorOpacity);

	if ((locked) and (colorLocked == "All")) then
		MinimapButtonFrame:SetBackdropColor(0,0,0,0);
		MinimapButtonFrame:SetBackdropBorderColor(0,0,0,0);
	elseif ((locked) and (colorLocked == "Border")) then
		MinimapButtonFrame:SetBackdropColor(red, green, blue, colorOpacity);
		MinimapButtonFrame:SetBackdropBorderColor(0,0,0,0);
	elseif ((locked) and (colorLocked == "Background")) then
		MinimapButtonFrame:SetBackdropColor(0,0,0,0);
		MinimapButtonFrame:SetBackdropBorderColor(1,1,1,1);
	else
		MinimapButtonFrame:SetBackdropColor(red, green, blue, colorOpacity);
		MinimapButtonFrame:SetBackdropBorderColor(1,1,1,1);
	end
end

function MBFCDropDownMenu_Hide()
	local optionID = this:GetID();

	UIDropDownMenu_SetSelectedID(MBFCColorLockedDropDown, optionID);
	if (optionID == 1) then
		colorLocked = "Nothing";
	elseif (optionID == 2) then
		colorLocked = "Border";
	elseif (optionID == 3) then
		colorLocked = "Background";
	elseif (optionID == 4) then
		colorLocked = "All";
	end
	MBFC_ColorLocked();
	updateMBFVars();
	updatePositions();
end

function toggleSort()
	if (sortOrder == "Alpha") then
		sortOrder = "BlizzFirst";
	elseif (sortOrder == "BlizzFirst") then
		sortOrder = "BlizzLast";
	elseif (sortOrder == "BlizzLast") then
		sortOrder = "Alpha";
	end
	updateMBFVars();
	updatePositions();
end

function MBFC_BlizzButtonToggle(frameName)
	if (getglobal("MBFHide"..frameName) == false) then
		getglobal(frameName):Hide();
		setglobal("MBFHide"..frameName,true);
		if (frameName == "MinimapZoomIn") then
			MinimapZoomOut:Hide();
		end
	else
		getglobal(frameName):Show();
		setglobal("MBFHide"..frameName,false);
		if (frameName == "MinimapZoomIn") then
			MinimapZoomOut:Show();
		end
	end
	updateMBFVars();
	MBF_Scan();
end

function MBFC_RollUp(setting)
	if (setting == 1) then
		MBFRestoreButton:ClearAllPoints();
		MBFRestoreButton:SetPoint(MinimapButtonFrameDragButton:GetPoint());
		MBFRestoreButton:Show();
		MBFRestoreButton:SetFrameLevel(MinimapButtonFrameDragButton:GetFrameLevel());
		MBFRestoreButton:SetFrameStrata(MinimapButtonFrameDragButton:GetFrameStrata());
		rollUp = true;
	elseif (setting == 2) then
		MinimapButtonFrameDragButton:ClearAllPoints();
		MinimapButtonFrameDragButton:SetPoint(MBFRestoreButton:GetPoint());
		MBFRestoreButton:Hide();
		rollUp = false;
	end
	updateMBFVars();
end

function MBFC_Defaults()
	local button;

	MBFC:Hide();
	
	MBF_Ignore = CloneTable(MBF_Default_Ignore)
	MBF_Include = CloneTable(MBF_Default_Include)
	MBF_FrameLocation = { "CENTER", "CENTER", 0, 0 };
	MBF_Vars = { 5, 3, .8, false, 1, false, false, "Nothing", true, false, false, false, 1, { 0, 0, 0}, true, "Alpha", false, false, false, false, false, false, true, false };
	padding, columns_or_rows, addonScale, debug, opacity, sort_by_rows, locked, colorLocked, MBFminimapButton, mbfHidden, grabBlizzButtons, grabMBFButton, colorOpacity, MBFBackdropColor, activeScanning, sortOrder, MBFHideMiniMapTrackingFrame, MBFHideMiniMapVoiceChatFrame, MBFHideMiniMapWorldMapButton, MBFHideMinimapZoomIn, MBFHideMiniMapMailFrame, MBFHideGameTimeFrame, disabledMail, rollUp = unpack(MBF_Vars);

	setMBFLocation();
	MinimapButtonFrame:SetUserPlaced(false);

	ClearMBF();

	MBF_ButtonInfoStorage = {};
	MBF_ChildEventStorage = {};
	
	MinimapButtonFrameDragButton:Show();
	MinimapButtonFrame:Show();

	MBFMiniButtonFrame:Show();
	MBFMiniButtonFrame:ClearAllPoints();
	MBFMiniButtonFrame:SetClampedToScreen(false);
	MBFMiniButtonFrame:SetPoint("TOPLEFT", Minimap, "LEFT", -30, 10);
	

	for k,v in pairs(BlizzButtons) do
		button = getglobal(v);
		if (button ~= nil) then
			if ((button:GetName() ~= "MiniMapMeetingStoneFrame") and (button:GetName() ~= "MiniMapBattlefieldFrame")) then
				button:Show();
			end
		end
	end

	MinimapButtonFrame:SetAlpha(opacity);
	MinimapButtonFrame:SetScale(addonScale);
	MBFRestoreButton:SetAlpha(opacity);
	MBFRestoreButton:SetScale(addonScale);
	MBFC_ColorLocked();

	MBF_Scan();
end

function MBFC_Init()
	local red;
	local green;
	local blue;
	local frame;
	local framevar;
	
	MBFCSortbyRows:SetChecked(sort_by_rows);
	MBFCLocked:SetChecked(locked);
	MBFCAutohide:SetChecked(autoHide);
	MBFCSliderColumns:SetValue(columns_or_rows);
	MBFCSliderPadding:SetValue(padding);
	MBFCSliderOpacity:SetValue(opacity);
	MBFCSliderScale:SetValue(addonScale);
	MBFCMinimapButton:SetChecked(MBFminimapButton);
	MBFCGrabBlizzButtons:SetChecked(grabBlizzButtons);
	MBFCGrabMBFButton:SetChecked(grabMBFButton);
	MBFCSliderColorOpacity:SetValue(colorOpacity);
	MBFCActiveScanning:SetChecked(activeScanning);
	MBFCDisabledMail:SetChecked(disabledMail);

	UIDropDownMenu_Initialize(MBFCSortDropDown, MBFCSort_Initialize);
	UIDropDownMenu_Initialize(MBFCColorLockedDropDown, MBFCColorLocked_Initialize);

	red, green, blue = unpack(MBFBackdropColor);

	MBFCColorSelect:SetColorRGB(red, green, blue);	

	for k,v in ipairs(BlizzButtons) do
		if ((v ~= "MinimapZoomOut") and (v ~= "MiniMapBattlefieldFrame") and (v ~= "MiniMapMeetingStoneFrame")) then
			frame = getglobal("MBFCHide"..v);
			framevar = getglobal("MBFHide"..v);
			frame:SetChecked(framevar);
		end
	end
end

-- Button Tooltip

function mbfButton_OnEnter()
	GameTooltip:SetOwner(MBFButton, "ANCHOR_LEFT");
	GameTooltip:SetText("Minimap Button Frame");
	GameTooltipTextLeft1:SetTextColor(1, 1, 1);
	if (grabMBFButton == false) then
		GameTooltip:AddLine(MBF_TOOLTIP_FULL);
	else
		GameTooltip:AddLine(MBF_TOOLTIP_SMALL);
	end
	GameTooltip:Show();
end

function NoMail_OnEnter()
	GameTooltip:SetOwner(MiniMapMailFrameDisabled, "ANCHOR_LEFT");
	GameTooltip:SetText(MBF_TOOLTIP_NO_MAIL);
	GameTooltip:Show();
end

function RollUp_OnEnter(setting)
	if (setting == 1) then
		GameTooltip:SetOwner(MinimapButtonFrameDragButton, "ANCHOR_LEFT");
	elseif (setting == 2) then
		GameTooltip:SetOwner(MBFRestoreButton, "ANCHOR_LEFT");
	end
	GameTooltipTextLeft1:SetTextColor(1, 1, 1);
	GameTooltip:AddLine(MBF_TOOLTIP_ROLLUP);
	GameTooltip:Show();

end

function MBF_OnLeave()
	GameTooltip:Hide();
end

-- Snap to Minimap

function snapMinimap()  
	local mapSize = ((Minimap:GetTop()-Minimap:GetBottom()) / 2);
	local scale = Minimap:GetEffectiveScale(); -- UIParent:GetScale();
	local cX, cY = GetCursorPosition();
	local mX, mY = Minimap:GetCenter();
	
	
	cX, cY = cX/scale, cY/scale;
	
	local width, height = (cX-mX), (cY-mY);
	local dist = sqrt(width^2 + height^2);

	MBFMiniButtonFrame:ClearAllPoints();

	if ( dist <= mapSize + 33) then
		local minimapShape = "ROUND";
		if Squeenix then
			minimapShape = "SQUARE";
		elseif GetMinimapShape then
			minimapShape = GetMinimapShape and GetMinimapShape() or "ROUND";
		elseif simpleMinimap_Skins then
			local skins ={ "ROUND",
						   "SQUARE",
						   "CORNER-BOTTOMLEFT",
						   "CORNER-BOTTOMRIGHT",
						   "CORNER-TOPRIGHT",
						   "CORNER-TOPLEFT" 
			}
			minimapShape = skins[simpleMinimap_Skins.db.profile.skin];
		elseif pfUI and pfUI_config["disabled"]["minimap"] ~= "1" then
			minimapShape = "SQUARE";
		end
		local quadTable = MinimapShapes[minimapShape]; 
		
		local a = atan(height/width);
		if ( width < 0 ) then
			a = a + 180;
		end
		local x = cos(a);
		local y = sin(a);
		local q = 1;

		if cX < mX then
			q = q + 1;	
		end
		if cY >= mY then
			q = q + 2;
		end
		if quadTable[q] then
			x = x * mapSize;
			y = y * mapSize;
		else
			local diagDist = math.sqrt(2*(mapSize)^2);
			x = math.max(-mapSize, math.min(x*diagDist, mapSize));
			y = math.max(-mapSize, math.min(y*diagDist, mapSize));
		end
		MBFMiniButtonFrame:SetClampedToScreen(false);
	MBFMiniButtonFrame:SetPoint("CENTER", Minimap, "CENTER", x/(addonScale/scale), y/(addonScale/scale));
	else
		MBFMiniButtonFrame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", cX/(addonScale/scale), cY/(addonScale/scale));
		MBFMiniButtonFrame:SetClampedToScreen(true);
	end
	
end
