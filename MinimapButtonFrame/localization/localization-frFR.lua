-- Localisation française de mini-bouton cadre

if (GetLocale() == "frFR") then

	-- Fixations
	BINDING_HEADER_MBF_SEP = "Minimap Button Frame";
	BINDING_NAME_MBF_CONFIG = "Basculer Config";
	BINDING_NAME_MBF_TOGGLE = "Basculer MBF";
	BINDING_NAME_MBF_ADD = "Bouton Ajouter";
	BINDING_NAME_MBF_REMOVE = "Bouton Supprimer";

	-- Config
	MBF_CONFIG_MBFOptions = "Options MBF";

	MBF_CONFIG_SortbyRows = "Trier par lignes";
	MBF_CONFIG_Locked = "Verrouillé";
	MBF_CONFIG_Autohide = "Masquage automatique";
	MBF_CONFIG_SortOrder = "Trier";
	MBF_CONFIG_HideLocked = "Masquer en position verrouillée";
	MBF_CONFIG_ColumnsorRows = "Des colonnes ou des lignes";
	MBF_CONFIG_Padding = "Padding";
	MBF_CONFIG_Opacity = "Opacité";
	MBF_CONFIG_Scale = "Échelle";
	MBF_CONFIG_BackgroundColor = "Couleur d'arrière-plan";
	MBF_CONFIG_ShowMinimapButton = "Voir la mini-bouton";
	MBF_CONFIG_CollectBlizz = "Recueillir Blizzard mini-boutons";
	MBF_CONFIG_CollectMBF = "Recueillir MBF mini-bouton";
	MBF_CONFIG_ActiveScanning = "Activer Active balayage";
	MBF_CONFIG_DisabledMail = "Afficher l'icône No Mail";
	MBF_CONFIG_SetDefaults = "Par défaut";
	MBF_CONFIG_HideMail = "Masquer l'icône Blizzard mail";
	MBF_CONFIG_HideTracking = "Masquer Blizzard suivi bouton";
	MBF_CONFIG_HideVoice = "Masquer Blizzard bouton Voice Chat";
	MBF_CONFIG_HideGameTime = "Masquer Blizzard temps de jeu d'icône";
	MBF_CONFIG_HideZoom = "Masquer Blizzard mini boutons de zoom";
	MBF_CONFIG_HideWorldMap = "Masquer la carte du monde bouton";
	MBF_CONFIG_Display = "Afficher";
	MBF_CONFIG_Gathering = "Gathering";
	MBF_CONFIG_Ok = "OK";

	-- Menus déroulants
	MBF_DROPDOWN_Alpha = "Ordre alphabétique";
	MBF_DROPDOWN_BlizzFirst = "Blizz première";
	MBF_DROPDOWN_BlizzLast = "Blizz dernier";
	MBF_DROPDOWN_Nothing = "Rien caché";
	MBF_DROPDOWN_Border = "Masquer la frontière";
	MBF_DROPDOWN_Background = "Masquer Contexte";
	MBF_DROPDOWN_Both = "Masquer Les deux";

	-- Messages d'erreur
	MBF_ERR1 = "Erreur lors de la suppression du bouton de stockage";
	MBF_ERR2 = "Seuls les boutons sur la MinimapButtonFrame peuvent être retirées de celle-ci.";
	MBF_ERR3 = "Erreur lors de la suppression invisible bouton de stock.";
	MBF_ERR4 = "Impossible d'ajouter. Non valable un bouton ou déjà inclus!";
	MBF_ERR5 = "Erreur lors de la suppression des enfants Manifestations de stockage.";

	-- Mini-bouton d'aide
	MBF_TOOLTIP_FULL = "|cff1eff00Clic gauche|r  pour Cacher/Afficher l'image\n|cff1eff00Maj-cliquez|r pour montrer l'écran de configuration\n|cff1eff00Cliquez-droit + glisser|r pour déplacer le bouton";
	MBF_TOOLTIP_SMALL = "|cff1eff00Maj-cliquez|r pour montrer l'écran de configuration";
	MBF_TOOLTIP_NO_MAIL = "Aucun nouveau message";
	MBF_TOOLTIP_ROLLUP = "|cff1eff00Clic gauche + glisser |r de se déplacer MBF\n|cff1eff00Cliquez-droit|r à Masquer / Afficher l'image";

	-- Commandes Slash
	MBF_SLASH_Usage = "Usage";
	MBF_SLASH_Version = "Version";
	MBF_SLASH_Overview = "Usage /mbf [ ajouter | supprimer | info | balayage | config | montrer | masquer | aide ] ";
	MBF_SLASH_Info = "info";
	MBF_SLASH_Show = "montrer";
	MBF_SLASH_Hide = "masquer";
	MBF_SLASH_Scan = "balayage";
	MBF_SLASH_Help = "aide";
	MBF_SLASH_Detail1 = "Usage /mbf [ ajouter | supprimer | info | balayage | config | montrer | masquer | aide ] ";
	MBF_SLASH_Detail2 = "ajouter - ajoute un bouton d'auto recueillies au cadre";
	MBF_SLASH_Detail3 = "supprimer - supprime un bouton réunis du cadre";
	MBF_SLASH_Detail4 = "info - affiche des informations sur l'objet sous le curseur";
	MBF_SLASH_Detail5 = "balayage - Effectue un balayage manuel pour les mini-boutons";
	MBF_SLASH_Detail6 = "config - Affiche l'écran de configuration.";
	MBF_SLASH_Detail7 = "montrer - Montre les principaux MBF écran. ";
	MBF_SLASH_Detail8 = "masquer - Il cache les principaux MBF écran.";
	MBF_SLASH_Detail9 = "aide - Spectacles commande aide et d'information";
	MBF_SLASH_Debug = "debug";
	MBF_SLASH_Config = "config";
	MBF_SLASH_Remove = "supprimer";
	MBF_SLASH_Add = "ajouter";
	MBF_SLASH_Sort = "trier";

	-- Affichage des informations
	MBF_UnnamedObject = "Objet sans nom";
	MBF_UnknownObjectType = "Inconnu type d'objet";
	MBF_ObjectType = "Objet Type";
	MBF_Parent = "Parent";
	MBF_UnknownParentName = "Nom du parent inconnu";
	MBF_NoParent = "Aucun Parent";

end