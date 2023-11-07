-- Español localización para minimapa botón Frame

if (GetLocale() == "esES") then

	-- Ataduras
	BINDING_HEADER_MBF_SEP = "Minimapa Botón Frame";
	BINDING_NAME_MBF_CONFIG = "Cambiar configuración";
	BINDING_NAME_MBF_TOGGLE = "Cambiar MBF";
	BINDING_NAME_MBF_ADD = "Añadir Botón";
	BINDING_NAME_MBF_REMOVE = "Eliminar Botón";

	-- Config
	MBF_CONFIG_MBFOptions = "MBF Opciones";

	MBF_CONFIG_SortbyRows = "Ordenar por filas";
	MBF_CONFIG_Locked = "Cerrado";
	MBF_CONFIG_Autohide = "Auto-escondite";
	MBF_CONFIG_SortOrder = "Ordenar";
	MBF_CONFIG_HideLocked = "Ocultar una vez cerradas";
	MBF_CONFIG_ColumnsorRows = "Columnas o Filas";
	MBF_CONFIG_Padding = "Relleno";
	MBF_CONFIG_Opacity = "Opacidad";
	MBF_CONFIG_Scale = "Escala";
	MBF_CONFIG_BackgroundColor = "Color de fondo";
	MBF_CONFIG_ShowMinimapButton = "Mostrar Minimap Botón";
	MBF_CONFIG_CollectBlizz = "Recoger Blizzard Minimap Botones";
	MBF_CONFIG_CollectMBF = "Recoger MBF Minimap Botón";
	MBF_CONFIG_ActiveScanning = "Habilitar Active Scanning";
	MBF_CONFIG_DisabledMail = "Mostrar icono de correo no";
	MBF_CONFIG_SetDefaults = "Predeterminados";
	MBF_CONFIG_HideMail = "Ocultar Blizzard Icono de Correo";
	MBF_CONFIG_HideTracking = "Ocultar Blizzard Botón de Seguimiento";
	MBF_CONFIG_HideVoice = "Ocultar Blizzard Chat de voz Botón";
	MBF_CONFIG_HideGameTime = "Ocultar Blizzard tiempo de juego de iconos";
	MBF_CONFIG_HideZoom = "Ocultar Blizzard Minimap botones de zoom";
	MBF_CONFIG_HideWorldMap = "Ocultar Mapa del Mundo botón";
	MBF_CONFIG_Display = "Pantalla";
	MBF_CONFIG_Gathering = "Gathering";
	MBF_CONFIG_Ok = "OK";

	-- Menús
		

	MBF_DROPDOWN_Alpha = "Alfabéticamente";
	MBF_DROPDOWN_BlizzFirst = "Blizz Primera";
	MBF_DROPDOWN_BlizzLast = "Blizz Última";
	MBF_DROPDOWN_Nothing = "Nada de lo Oculto";
	MBF_DROPDOWN_Border = "Ocultar las fronteras";
	MBF_DROPDOWN_Background = "Ocultar Antecedentes";
	MBF_DROPDOWN_Both = "Ocultar Tanto";

	-- Mensajes de error

	MBF_ERR1 = "Error al eliminar Botón de Almacenamiento";
	MBF_ERR2 = "Sólo los botones de la MinimapButtonFrame puede quitarse de ella."
	MBF_ERR3 = "Error al eliminar Invisible Botón de almacenamiento."
	MBF_ERR4 = "No se puede añadir. No es un botón válido o ya incluidos!";
	MBF_ERR5 = "Error al eliminar Niño Eventos de almacenamiento.";

	-- Minimapa botón de ayuda
	MBF_TOOLTIP_FULL = "|cff1eff00Izquierda Haga Clic|r aquí para Mostrar/Ocultar el marco\n|cff1eff00Shift Clic|r para ver la pantalla de configuración\n|cff1eff00Haga clic derecho + arrastrar|r para mover el botón";
	MBF_TOOLTIP_SMALL = "|cff1eff00Shift clic|r para ver la pantalla de configuración";
	MBF_TOOLTIP_NO_MAIL = "No tienes mensajes nuevos";
	MBF_TOOLTIP_ROLLUP = "|cff1eff00Haga clic izquierdo + arrastrar|r para mover MBF\n|cff1eff00Haga clic derecho en|r a Mostrar / Ocultar el marco";

	-- Comandos Slash

	MBF_SLASH_Usage = "Uso";
	MBF_SLASH_Version = "Versión";
	MBF_SLASH_Overview = "Uso / mbf [añadir | eliminar | info | escanear | config | mostrar | ocultar | ayuda] ";
	MBF_SLASH_Info = "info";
	MBF_SLASH_Show = "mostrar";
	MBF_SLASH_Hide = "ocultar";
	MBF_SLASH_Scan = "escanear";
	MBF_SLASH_Help = "ayuda";
	MBF_SLASH_Detail1 = "Uso / mbf [añadir | eliminar | info | escanear | config | mostrar | ocultar | ayuda] ";
	MBF_SLASH_Detail2 = "añadir - añade un auto no se reunieron botón para el marco";
	MBF_SLASH_Detail3 = "eliminar - elimina un botón se reunieron el marco de";
	MBF_SLASH_Detail4 = "info - Muestra información sobre el objeto bajo el cursor";
	MBF_SLASH_Detail5 = "escanear - Realiza una búsqueda manual para minimapa botones";
	MBF_SLASH_Detail6 = "config - Muestra la pantalla de configuración."
	MBF_SLASH_Detail7 = "mostrar - Muestra la pantalla principal MBF";
	MBF_SLASH_Detail8 = "ocultar - Oculta la pantalla principal MBF.";
	MBF_SLASH_Detail9 = "ayuda - Muestra comando ayuda e información";
	MBF_SLASH_Debug = "debug";
	MBF_SLASH_Config = "config";
	MBF_SLASH_Remove = "eliminar";
	MBF_SLASH_Add = "añadir";
	MBF_SLASH_Sort = "tipo";

	-- Mostrar Información

	MBF_UnnamedObject = "Sin nombre del objeto";
	MBF_UnknownObjectType = "tipos de objeto desconocido";
	MBF_ObjectType = "tipos de objeto";
	MBF_Parent = "Padres";
	MBF_UnknownParentName = "Nombre del Padre Desconocido";
	MBF_NoParent = "No hay Padres";

end
