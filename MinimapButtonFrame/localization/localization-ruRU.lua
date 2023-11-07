if (GetLocale() == "ruRU") then

	-- Bindings
	BINDING_HEADER_MBF_SEP = "Minimap Button Frame"
	BINDING_NAME_MBF_CONFIG = "Переключить настройки"
	BINDING_NAME_MBF_TOGGLE = "Переключить MBF"
	BINDING_NAME_MBF_ADD = "Добавить кнопку"
	BINDING_NAME_MBF_REMOVE = "Удалить кнопку"

	-- Config

	MBF_CONFIG_MBFOptions = "MBF Настройки";

	MBF_CONFIG_SortbyRows = "Сортировать по рядам";
	MBF_CONFIG_Locked = "Закрепить";
	MBF_CONFIG_Autohide = "Авто-скрытие";
	MBF_CONFIG_SortOrder = "Порядок сортировки";
	MBF_CONFIG_HideLocked = "Скрыть при закреплении";
	MBF_CONFIG_ColumnsorRows = "Колонки или Ряды";
	MBF_CONFIG_Padding = "Промежуток";
	MBF_CONFIG_Opacity = "Прозрачность";
	MBF_CONFIG_Scale = "Масштаб";
	MBF_CONFIG_BackgroundColor = "Цвет фона";
	MBF_CONFIG_ShowMinimapButton = "Показ кнопку у мини-карты";
	MBF_CONFIG_CollectBlizz = "Собрать кнопки Blizzard";
	MBF_CONFIG_CollectMBF = "Собрать кнопку MBF";
	MBF_CONFIG_ActiveScanning = "Включить активный поиск кнопок";
	MBF_CONFIG_DisabledMail = "Скрыть иконку почты";
	MBF_CONFIG_SetDefaults = "Сбросить настройки";
	MBF_CONFIG_HideMail = "Скрыть иконку почты Blizzard";
	MBF_CONFIG_HideTracking = "Скрыть иконку трека Blizzard";
	MBF_CONFIG_HideGameTime = "Скрыть иконку времени Blizzard";
	MBF_CONFIG_HideZoom = "Скрыть кнопки масштаба миникрты Blizzard";
	
	MBF_CONFIG_Display = "Отображение";
	MBF_CONFIG_Gathering = "Сбор";
	MBF_CONFIG_Ok = "ОК";

	-- Dropdowns
	MBF_DROPDOWN_Alpha = "По алфавиту";
	MBF_DROPDOWN_BlizzFirst = "Сначало Blizz";
	MBF_DROPDOWN_BlizzLast = "Потом Blizz";
	MBF_DROPDOWN_Nothing = "Ничего не скрыто";
	MBF_DROPDOWN_Border = "Скрыть рамку";
	MBF_DROPDOWN_Background = "Скрыть фон";
	MBF_DROPDOWN_Both = "Скрыть все";

	-- Error Messages

	MBF_ERR1 = "Ошибка удаления кнопки из хранилища";
	MBF_ERR2 = "Только кнопки на MinimapButtonFrame могут быть удалены с него.";
	MBF_ERR3 = "Ошибка удаления невидимой кнопки из хранилища.";
	MBF_ERR4 = "Невозможно добавить. Защищена или уже добавлена!";
	MBF_ERR5 = "Ошибка удаления дочернего события из хранилища.";

	-- Minimap Button Tooltip
	MBF_TOOLTIP_FULL = "|cff1eff00Левый-Клик|r - скрыть/показать фрейм\n|cff1eff00Shift-Клик|r - открыть окно настроек\n|cff1eff00Правый-Клик + тащить|r для перемещения кнопки";
	MBF_TOOLTIP_SMALL = "|cff1eff00Shift-Клик|r - открыть окно настроек";
	MBF_TOOLTIP_NO_MAIL = "Новой почты - Нет";
	MBF_TOOLTIP_ROLLUP = "|cff1eff00Левый-Клик + тащить|r - переместить MBF\n|cff1eff00Правый-клик|r - скрыть/показать фрейм";

	-- Slash Commands

	MBF_SLASH_Usage = "Использование";
	MBF_SLASH_Version = "Версия";
	MBF_SLASH_Overview = "Usage /mbf [ add | remove | info | scan | config | show | hide | help ] ";
	MBF_SLASH_Info = "info";
	MBF_SLASH_Show = "show";
	MBF_SLASH_Hide = "hide";
	MBF_SLASH_Scan = "scan";
	MBF_SLASH_Help = "help";
	MBF_SLASH_Detail1 = "Используйте /mbf [ add | remove | info | scan | config | show | hide | help ] ";
	MBF_SLASH_Detail2 = "add - добавить кнопку, пропущенную авто сбором";
	MBF_SLASH_Detail3 = "remove - удалить собранную кнопку из окна MBF";
	MBF_SLASH_Detail4 = "info - показать информацию об объекте под курсором";
	MBF_SLASH_Detail5 = "scan - запустить ручное сканирование кнопок у миникарты";
	MBF_SLASH_Detail6 = "config - показывает окно настроек.";
	MBF_SLASH_Detail7 = "show - показывает главное окно MBF.";
	MBF_SLASH_Detail8 = "hide - скрывает главное окно MBF.";
	MBF_SLASH_Detail9 = "help - показывает помощб по камандам и информацию";
	MBF_SLASH_Debug = "debug";
	MBF_SLASH_Config = "config";
	MBF_SLASH_Remove = "remove";
	MBF_SLASH_Add = "add";
	MBF_SLASH_Sort = "sort";

	-- Display Info

	MBF_UnnamedObject = "Безымянный объект";
	MBF_UnknownObjectType = "Неизвестный тип объекта";
	MBF_ObjectType = "Тип объекта";
	MBF_Parent = "Родитель";
	MBF_UnknownParentName = "Неизвестное имя родителя";
	MBF_NoParent = "Нет родителя";

end