-- zhCN Localization for Minimap Button Frame
-- locale by 急云@CWDG 
-- update 2008-7-14 ver. MBF 1.9

if (GetLocale() == "zhCN") then

	-- Bindings
	BINDING_HEADER_MBF_SEP = "小地图按钮框架MBF";
	BINDING_NAME_MBF_CONFIG = "设置开关";
	BINDING_NAME_MBF_TOGGLE = "MBF开关";
	BINDING_NAME_MBF_ADD = "添加按钮";
	BINDING_NAME_MBF_REMOVE = "移除按钮";

	-- Config

	MBF_CONFIG_MBFOptions = "MBF选项";

	MBF_CONFIG_SortbyRows = "排列方向";
	MBF_CONFIG_Locked = "锁定";
	MBF_CONFIG_Autohide = "自动隐藏";
	MBF_CONFIG_SortOrder = "排序";
	MBF_CONFIG_HideLocked = "锁定后隐藏框体背景";
	MBF_CONFIG_ColumnsorRows = "每行排列数";
	MBF_CONFIG_Padding = "间距";
	MBF_CONFIG_Opacity = "透明度";
	MBF_CONFIG_Scale = "缩放";
	MBF_CONFIG_BackgroundColor = "背景颜色";
	MBF_CONFIG_ShowMinimapButton = "显示小地图按钮";
	MBF_CONFIG_CollectBlizz = "收纳小地图系统按钮";
	MBF_CONFIG_CollectMBF = "收纳MBF小地图按钮";
	MBF_CONFIG_ActiveScanning = "启动动态扫描";
	MBF_CONFIG_DisabledMail = "显示无新邮件图标";
	MBF_CONFIG_SetDefaults = "设为默认";
	MBF_CONFIG_HideMail = "隐藏系统邮件图标";
	MBF_CONFIG_HideTracking = "隐藏系统追踪按钮";
	MBF_CONFIG_HideVoice = "隐藏系统语音聊天按钮";
	MBF_CONFIG_HideGameTime = "隐藏系统游戏时间图标";
	MBF_CONFIG_HideZoom = "隐藏系统小地图缩放按钮";
	MBF_CONFIG_HideWorldMap = "隐藏世界地图按钮";
	MBF_CONFIG_Display = "显示";
	MBF_CONFIG_Gathering = "采集";
	MBF_CONFIG_Ok = "确认";

	-- Dropdowns
	MBF_DROPDOWN_Alpha = "字母排序";
	MBF_DROPDOWN_BlizzFirst = "系统钮优先";
	MBF_DROPDOWN_BlizzLast = "系统钮最后";
	MBF_DROPDOWN_Nothing = "--------";
	MBF_DROPDOWN_Border = "隐藏边框";
	MBF_DROPDOWN_Background = "隐藏背景";
	MBF_DROPDOWN_Both = "背景与边框";

	-- Error Messages

	MBF_ERR1 = "错误：移除按钮出错";
	MBF_ERR2 = "只能是MBF内按钮，不能移除框体.";
	MBF_ERR3 = "错误：移除按钮不存在.";
	MBF_ERR4 = "无法添加.  受保护或者已添加!";
	MBF_ERR5 = "错误：移除子事件.";

	-- Minimap Button Tooltip
	MBF_TOOLTIP_FULL = "|cff1eff00点击|r to 隐藏/显示MBF框体 \n|cff1eff00Shift+点击|r 打开设置\n|cff1eff00右键拖拽|r 移动位置";
	MBF_TOOLTIP_SMALL = "|cff1eff00Shift+点击|r 打开设置";
	MBF_TOOLTIP_NO_MAIL = "没有新的邮件";
	MBF_TOOLTIP_ROLLUP = "|cff1eff00点击 + 拖拽|r 移动 MBF\n|cff1eff00右键|r to 隐藏/显示 框体";

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
	MBF_SLASH_Detail2 = "add - 增加非自动采集按钮到MBF";
	MBF_SLASH_Detail3 = "remove - 移除MBF采集的按钮";
	MBF_SLASH_Detail4 = "info - 显示光标出按钮信息";
	MBF_SLASH_Detail5 = "scan - 手动扫描小地图按钮";
	MBF_SLASH_Detail6 = "config - 显示设置窗口.";
	MBF_SLASH_Detail7 = "show - 显示MBF.";
	MBF_SLASH_Detail8 = "hide - 隐藏MBF.";
	MBF_SLASH_Detail9 = "help - 显示命令的帮助和信息";
	MBF_SLASH_Debug = "debug";
	MBF_SLASH_Config = "config";
	MBF_SLASH_Remove = "remove";
	MBF_SLASH_Add = "add";
	MBF_SLASH_Sort = "sort";

	-- Display Info

	MBF_UnnamedObject = "无效对象";
	MBF_UnknownObjectType = "未知对象类型";
	MBF_ObjectType = "目标对象";
	MBF_Parent = "父级框体";
	MBF_UnknownParentName = "未知父级框体名称";
	MBF_NoParent = "无父级框体";

end