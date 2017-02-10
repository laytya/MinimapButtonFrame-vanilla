-- Do not load if Titan Bar is not loaded
if not IsAddOnLoaded("Titan") then
	return
end

TITAN_MBF_ID = "MBF";
TITAN_MBF_FREQUENCY = 1;

MBF_LOCALE = {
	menu = "Minimap Button Frame",
	tooltip = "Minimap Button Frame",
	button = "MBF"
};

MBF_TITAN_HINT = "|cff1eff00Left-Click|r to Hide/Show the frame\n|cff1eff00Shift-click|r to show the config screen";

function TitanPanelMBFButton_OnLoad()

	-- register plugin
	this.registry = { 
		id = TITAN_MBF_ID,
		menuText = MBF_LOCALE["menu"],
		buttonTextFunction = "TitanPanelMBFButton_GetButtonText",
		tooltipTitle = MBF_LOCALE["tooltip"],
		tooltipTextFunction = "TitanPanelMBFButton_GetTooltipText",
		category = "Interface",
		frequency = TITAN_MBF_FREQUENCY, 
		icon = "Interface\\Icons\\INV_Misc_Coin_11",
		iconWidth = 16,
		savedVariables = {
			ShowIcon = 1,
			ShowLabelText = 1,
			ShowColoredText = 1
		}
	};
	TitanPanelMBFButtonIcon:SetVertexColor(1, 1, 0);
end

function TitanPanelMBFButton_GetButtonText(id)
	local retstr = "";
	
	-- supports turning off labels
	if (TitanGetVar(TITAN_MBF_ID, "ShowLabelText")) then	
		if (TitanGetVar(TITAN_MBF_ID, "ShowColoredText")) then	
			retstr = TitanUtils_GetGreenText(MBF_LOCALE["button"]);
		else
			retstr = TitanUtils_GetNormalText(MBF_LOCALE["button"]);
		end
	end

	if ((mbfHidden == true) and ((grabMBFButton == true) or (minimapButton == false)) and (activeScanning == true))then
		MBF_Scan();
	end

	return retstr;
end

function TitanPanelMBFButton_GetTooltipText()
	return MBF_TITAN_HINT;
end

function TitanPanelRightClickMenu_PrepareMBFMenu()
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[TITAN_MBF_ID].menuText);
	
	TitanPanelRightClickMenu_AddSpacer();
	
	TitanPanelRightClickMenu_AddToggleIcon(TITAN_MBF_ID);
	TitanPanelRightClickMenu_AddToggleLabelText(TITAN_MBF_ID);
	TitanPanelRightClickMenu_AddToggleColoredText(TITAN_MBF_ID);
	
	TitanPanelRightClickMenu_AddSpacer();	
	
	TitanPanelRightClickMenu_AddCommand(TITAN_PANEL_MENU_HIDE, TITAN_MBF_ID, TITAN_PANEL_MENU_FUNC_HIDE);
end
