-- Do not load if FuBar is not loaded
if not IsAddOnLoaded("FuBar") then
	return
end

local tablet = AceLibrary("Tablet-2.0");
local AL = AceLibrary("AceLocale-2.2"):new("MBF");
local refreshTime = 1;
local fuBarName = "FuBarPluginMinimap Button FrameFrame";

MBFFu = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDB-2.0", "FuBarPlugin-2.0");

MBFFu.hasIcon = "Interface\\Icons\\INV_Misc_Coin_11";
MBFFu.defaultPosition = "RIGHT";
MBFFu.defaultMinimapPosition = 180;
MBFFu.cannotDetachTooltip = true;

MBFFu.hasNoColor = true;

MBFFu:RegisterDB("MBFFuDB");

function MBFFu:OnEnable()
	self:Update();

	self:ScheduleRepeatingEvent(self.name, self.Update, refreshTime, self)
end

function MBFFu:OnDisable()
	self:CancelScheduledEvent(self.name)
end

function MBFFu:OnDataUpdate()
	if ((mbfHidden == true) and (activeScanning == true))then
		MBF_Scan();
	end
end

function MBFFu:OnTooltipUpdate()
	local cat = tablet:AddCategory()
	
	if getglobal(fuBarName):IsShown() then
		cat:AddLine("text", "|cff1eff00Left-Click|r |cffffffffShow/Hide MBF|r")
	end
	cat:AddLine("text", "|cff1eff00Shift-Click|r |cffffffffShow Config Screen|r")
end

function MBFFu:OnClick(button)
	if IsShiftKeyDown() then
		MBFC_Toggle();
	else
		MBFC_Visible(2, this:GetParent():GetName());
	end
end

function MBFFu:OnTextUpdate()
	self:SetText("MBF")
end

