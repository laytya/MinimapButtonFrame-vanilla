-- zhCN Localization for Minimap Button Frame
-- locale by 急云@CWDG 
-- update 2008-7-14 ver. MBF 1.9

if (GetLocale() == "zhTW") then

	-- Bindings
	BINDING_HEADER_MBF_SEP = "小地圖按鈕框架MBF";
	BINDING_NAME_MBF_CONFIG = "設置開關";
	BINDING_NAME_MBF_TOGGLE = "MBF開關";
	BINDING_NAME_MBF_ADD = "添加按鈕";
	BINDING_NAME_MBF_REMOVE = "移除按鈕";

	-- Config

	MBF_CONFIG_MBFOptions = "MBF選項";

	MBF_CONFIG_SortbyRows = "排列方向";
	MBF_CONFIG_Locked = "鎖定";
	MBF_CONFIG_Autohide = "自动隐藏";
	MBF_CONFIG_SortOrder = "排序";
	MBF_CONFIG_HideLocked = "鎖定后隱藏框體背景";
	MBF_CONFIG_ColumnsorRows = "每行排列數";
	MBF_CONFIG_Padding = "間距";
	MBF_CONFIG_Opacity = "透明度";
	MBF_CONFIG_Scale = "縮放";
	MBF_CONFIG_BackgroundColor = "背景顏色";
	MBF_CONFIG_ShowMinimapButton = "顯示小地圖按鈕";
	MBF_CONFIG_CollectBlizz = "收納小地圖系統按鈕";
	MBF_CONFIG_CollectMBF = "收納MBF小地圖按鈕";
	MBF_CONFIG_ActiveScanning = "啟動動態掃描";
	MBF_CONFIG_DisabledMail = "顯示無新郵件圖標";
	MBF_CONFIG_SetDefaults = "設為默認";
	MBF_CONFIG_HideMail = "隱藏系統郵件圖標";
	MBF_CONFIG_HideTracking = "隱藏系統追蹤按鈕";
	MBF_CONFIG_HideVoice = "隱藏系統語音聊天按鈕";
	MBF_CONFIG_HideGameTime = "隱藏系統游戲時間圖標";
	MBF_CONFIG_HideZoom = "隱藏系統小地圖縮放按鈕";
	MBF_CONFIG_HideWorldMap = "隱藏世界地圖按鈕";
	MBF_CONFIG_Display = "顯示";
	MBF_CONFIG_Gathering = "采集";
	MBF_CONFIG_Ok = "確認";

	-- Dropdowns
	MBF_DROPDOWN_Alpha = "字母排序";
	MBF_DROPDOWN_BlizzFirst = "系統鈕優先";
	MBF_DROPDOWN_BlizzLast = "系統鈕最后";
	MBF_DROPDOWN_Nothing = "--------";
	MBF_DROPDOWN_Border = "隱藏邊框";
	MBF_DROPDOWN_Background = "隱藏背景";
	MBF_DROPDOWN_Both = "背景與邊框";

	-- Error Messages

	MBF_ERR1 = "錯誤：移除按鈕出錯";
	MBF_ERR2 = "只能是MBF內按鈕，不能移除框體.";
	MBF_ERR3 = "錯誤：移除按鈕不存在.";
	MBF_ERR4 = "無法添加.  受保護或者已添加!";
	MBF_ERR5 = "錯誤：移除子事件.";

	-- Minimap Button Tooltip
	MBF_TOOLTIP_FULL = "|cff1eff00點擊|r to 隱藏/顯示MBF框體 \n|cff1eff00Shift+點擊|r 打開設置\n|cff1eff00右鍵拖拽|r 移動位置";
	MBF_TOOLTIP_SMALL = "|cff1eff00Shift+點擊|r 打開設置";
	MBF_TOOLTIP_NO_MAIL = "沒有新的郵件";
	MBF_TOOLTIP_ROLLUP = "|cff1eff00點擊 + 拖拽|r 移動 MBF\n|cff1eff00右鍵|r to 隱藏/顯示 框體";

	-- Slash Commands

	MBF_SLASH_Usage = "用法";
	MBF_SLASH_Version = "版本";
	MBF_SLASH_Overview = "用法 /mbf [ add | remove | info | scan | config | show | hide | help ] ";
	MBF_SLASH_Info = "info";
	MBF_SLASH_Show = "show";
	MBF_SLASH_Hide = "hide";
	MBF_SLASH_Scan = "scan";
	MBF_SLASH_Help = "help";
	MBF_SLASH_Detail1 = "用法 /mbf [ add | remove | info | scan | config | show | hide | help ] ";
	MBF_SLASH_Detail2 = "add - 增加非自動采集按鈕到MBF";
	MBF_SLASH_Detail3 = "remove - 移除MBF采集的按鈕";
	MBF_SLASH_Detail4 = "info - 顯示光標出按鈕信息";
	MBF_SLASH_Detail5 = "scan - 手動掃描小地圖按鈕";
	MBF_SLASH_Detail6 = "config - 顯示設置窗口.";
	MBF_SLASH_Detail7 = "show - 顯示MBF.";
	MBF_SLASH_Detail8 = "hide - 隱藏MBF.";
	MBF_SLASH_Detail9 = "help - 顯示命令的幫助和信息";
	MBF_SLASH_Debug = "debug";
	MBF_SLASH_Config = "config";
	MBF_SLASH_Remove = "remove";
	MBF_SLASH_Add = "add";
	MBF_SLASH_Sort = "sort";

	-- Display Info

	MBF_UnnamedObject = "無效對象";
	MBF_UnknownObjectType = "未知對象類型";
	MBF_ObjectType = "目標對象";
	MBF_Parent = "父級框體";
	MBF_UnknownParentName = "未知父級框體名稱";
	MBF_NoParent = "無父級框體";

end