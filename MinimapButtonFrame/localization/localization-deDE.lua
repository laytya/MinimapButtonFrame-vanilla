-- Deutsch Lokalisierung für Minikarte Schaltfläche frame

if (GetLocale() == "deDE") then

	-- Bindings
	BINDING_HEADER_MBF_SEP = "Minikarte Schaltfläche frame";
	BINDING_NAME_MBF_CONFIG = "Toggle Config";
	BINDING_NAME_MBF_TOGGLE = "Toggle MBF";
	BINDING_NAME_MBF_ADD = "Schaltfläche Hinzufügen";
	BINDING_NAME_MBF_REMOVE = "Schaltfläche Entfernen";

	-- Config
	MBF_CONFIG_MBFOptions = "MBF Optionen";

	MBF_CONFIG_SortbyRows = "Sortieren von Zeilen";
	MBF_CONFIG_Locked = "Gesperrt";
	MBF_CONFIG_Autohide = "Automatisch ausblenden";
	MBF_CONFIG_SortOrder = "Sortierreihenfolge";
	MBF_CONFIG_HideLocked = "Ausblenden wenn gesperrt";
	MBF_CONFIG_ColumnsorRows = "Spalten oder Zeilen";
	MBF_CONFIG_Padding = "Padding";
	MBF_CONFIG_Opacity = "Opazität";
	MBF_CONFIG_Scale = "Maßstab";
	MBF_CONFIG_BackgroundColor = "Hintergrundfarbe";
	MBF_CONFIG_ShowMinimapButton = "Zeige Minikarte Schaltfläche";
	MBF_CONFIG_CollectBlizz = "Sammeln Blizzard Minikarte Tasten";
	MBF_CONFIG_CollectMBF = "Sammeln Sie MBF Minikarte Schaltfläche";
	MBF_CONFIG_ActiveScanning = "Aktivieren Sie Active Scanning";
	MBF_CONFIG_DisabledMail = "Zeige keine E-Mail-Symbol";
	MBF_CONFIG_SetDefaults = "Festlegen Standardwerte";
	MBF_CONFIG_HideMail = "Ausblenden der Blizzard E-Mail-Symbol";
	MBF_CONFIG_HideTracking = "Ausblenden der Blizzard Tracking-Tasten";
	MBF_CONFIG_HideVoice = "Ausblenden der Blizzard Voice Chat-Taten";
	MBF_CONFIG_HideGameTime = "Ausblenden der Blizzard Spiel Zeit-Symbol";
	MBF_CONFIG_HideZoom = "Ausblenden der Blizzard Minikarte Zoom-Tasten";
	MBF_CONFIG_HideWorldMap = "Ausblenden der Weltkarte-Taste";
	MBF_CONFIG_Display = "Anzeige";
	MBF_CONFIG_Gathering = "Gathering";
	MBF_CONFIG_Ok = "OK";

	-- Dropdowns
	MBF_DROPDOWN_Alpha = "Alphabetisch";
	MBF_DROPDOWN_BlizzFirst = "Erste blizz";
	MBF_DROPDOWN_BlizzLast = "Letzte blizz";
	MBF_DROPDOWN_Nothing = "Nichts Hidden";
	MBF_DROPDOWN_Border = "Border ausblenden";
	MBF_DROPDOWN_Background = "Hintergrund ausblenden";
	MBF_DROPDOWN_Both = "Beide ausblenden";

	-- Fehlermeldungen

	MBF_ERR1 = "Fehler beim Entfernen-Taste aus der Lagerung";
	MBF_ERR2 = "Nur Tasten auf der MinimapButtonFrame kann daraus entfernt.";
	MBF_ERR3 = "Fehler beim Entfernen von unsichtbaren Schaltfläche Lagerung.";
	MBF_ERR4 = "Kann nicht hinzufügen. Nicht eine gültige Taste oder bereits inbegriffen!";
	MBF_ERR5 = "Fehler beim Entfernen des Kindes Veranstaltungen Lagerung.";

	-- Minikarte Taste Tooltip
	MBF_TOOLTIP_FULL = "|cff1eff00Links-Klicken|r auf Hide/Show den Rahmen\n|cff1eff00Shift-Klick|r auf den Bildschirm config\n|cff1eff00Recht-Klicken + Ziehen|r bewegen Sie die Taste";
	MBF_TOOLTIP_SMALL = "|cff1eff00Shift-Klick|r auf den Bildschirm config";
	MBF_TOOLTIP_NO_MAIL = "Keine neue Nachricht";
	MBF_TOOLTIP_ROLLUP = "|cff1eff00Links-Klicken + Drag|r bewegen MBF\n|cff1eff00Recht-Klicken|r auf Hide / Show den Rahmen ";

	-- Slash-Befehle

	MBF_SLASH_Usage = "Usage";
	MBF_SLASH_Version = "Version";
	MBF_SLASH_Overview = "Usage /mbf [ hinzufügen | entfernen | infos | scannen | konfiguration | zeigen | verstecken | hilfe ] ";
	MBF_SLASH_Info = "infos";
	MBF_SLASH_Show = "zeigen";
	MBF_SLASH_Hide = "verstecken";
	MBF_SLASH_Scan = "scannen";
	MBF_SLASH_Help = "hilfe";
	MBF_SLASH_Detail1 = "Usage /mbf [ hinzufügen | entfernen | infos | scannen | konfiguration | zeigen | verstecken | hilfe ] ";
	MBF_SLASH_Detail2 = "hinzufügen - eine nicht automatisch gesammelt-Taste, um den Rahmen";
	MBF_SLASH_Detail3 = "entfernen - entfernt ein gesammelt Button aus dem Rahmen";
	MBF_SLASH_Detail4 = "infos - Zeigt Informationen über das Objekt unter dem Cursor";
	MBF_SLASH_Detail5 = "scannen - Führt einen manuellen Scan-Buttons für Minikarte";
	MBF_SLASH_Detail6 = "konfiguration - Zeigt die Konfigurations-Bildschirm";
	MBF_SLASH_Detail7 = "zeigen - Zeigt die wichtigsten MBF Bildschirm. ";
	MBF_SLASH_Detail8 = "verstecken - Versteckt die wichtigsten MBF Bildschirm.";
	MBF_SLASH_Detail9 = "hilfe - Zeigt Befehl Hilfe und Informationen";
	MBF_SLASH_Debug = "debug";
	MBF_SLASH_Config = "konfiguration";
	MBF_SLASH_Remove = "entfernen";
	MBF_SLASH_Add = "hinzufügen";
	MBF_SLASH_Sort = "sortieren";

	-- Anzeige Info

	MBF_UnnamedObject = "Unbenannt Object";
	MBF_UnknownObjectType = "Unbekannt Objekttyp";
	MBF_ObjectType = "Objekttyp";
	MBF_Parent = "Muttergesellschaft";
	MBF_UnknownParentName = "Unbekannt Muttergesellschaft Name";
	MBF_NoParent = "kein übergeordnetes";
end