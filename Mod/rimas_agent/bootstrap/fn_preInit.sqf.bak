
setInspect = {
	params ["_object"];
	[_object, (getObjectTextures _object) select 0] call BIS_fnc_initInspectable;
};

private ['_code', '_function', '_file', '_fileContent'];

secExt = {
	// diag_log format ["CALL-SECEXT: %1",_this];
	"secExt" callExtension _this
};

sec = {
	// diag_log format ["CALL-SECEXT: %1",_this];
	("secExt" callExtension _this) select 0;
};

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
	if (isText (missionConfigFile >> 'CfgOverwritesRAgent' >> _function)) then
	{
		_file = getText (missionConfigFile >> 'CfgOverwritesRAgent' >> _function);
	};
    _fileContent = preprocessFileLineNumbers _file;
    if (_fileContent isEqualTo '') then
    {
        diag_log (format ['ERROR: Override of %1 in CfgOverwritesRAgent points to a non-existent file: %2. Defaulting to rimas_agent function!', _function, _file]);

        _fileContent = preprocessFileLineNumbers (_x select 1);
    };
    _code = compile _fileContent;

    missionNamespace setVariable [_function, _code];
}
forEach
[
	["RRPClient_system_connectServer", 						"rimas_agent\code\restarts\RRPClient_system_connectServer.sqf"],
	["RRPClient_system_logoutOnRestrart", 					"rimas_agent\code\restarts\RRPClient_system_logoutOnRestrart.sqf"],

	["RRPClient_reg_delete", 								"rimas_agent\code\reg\RRPClient_reg_delete.sqf"],
	["RRPClient_reg_isKeyPresent", 							"rimas_agent\code\reg\RRPClient_reg_isKeyPresent.sqf"],
	["RRPClient_reg_read", 									"rimas_agent\code\reg\RRPClient_reg_read.sqf"],
	["RRPClient_reg_write", 								"rimas_agent\code\reg\RRPClient_reg_write.sqf"],

	["RRPClient_util_playerCargo_add",						"rimas_agent\code\util_playerCargo\RRPClient_util_playerCargo_add.sqf"],
	["RRPClient_util_playerCargo_canAdd",					"rimas_agent\code\util_playerCargo\RRPClient_util_playerCargo_canAdd.sqf"],
	["RRPClient_util_playerCargo_clear",					"rimas_agent\code\util_playerCargo\RRPClient_util_playerCargo_clear.sqf"],
	["RRPClient_util_playerCargo_deserialize",				"rimas_agent\code\util_playerCargo\RRPClient_util_playerCargo_deserialize.sqf"],
	["RRPClient_util_playerCargo_list",						"rimas_agent\code\util_playerCargo\RRPClient_util_playerCargo_list.sqf"],
	["RRPClient_util_playerCargo_remove",					"rimas_agent\code\util_playerCargo\RRPClient_util_playerCargo_remove.sqf"],
	["RRPClient_util_playerCargo_serialize",				"rimas_agent\code\util_playerCargo\RRPClient_util_playerCargo_serialize.sqf"],
	["RRPClient_util_playerCargo_takeAll",					"rimas_agent\code\util_playerCargo\RRPClient_util_playerCargo_takeAll.sqf"],
	["RRPClient_util_playerEquipment_add",					"rimas_agent\code\util_playerCargo\RRPClient_util_playerEquipment_add.sqf"],
	["RRPClient_util_playerEquipment_canAdd",				"rimas_agent\code\util_playerCargo\RRPClient_util_playerEquipment_canAdd.sqf"],
	["RRPClient_util_playerEquipment_clear",				"rimas_agent\code\util_playerCargo\RRPClient_util_playerEquipment_clear.sqf"],
	["RRPClient_util_playerEquipment_contains",				"rimas_agent\code\util_playerCargo\RRPClient_util_playerEquipment_contains.sqf"],
	["RRPClient_util_playerEquipment_deserialize",			"rimas_agent\code\util_playerCargo\RRPClient_util_playerEquipment_deserialize.sqf"],
	["RRPClient_util_playerEquipment_list",					"rimas_agent\code\util_playerCargo\RRPClient_util_playerEquipment_list.sqf"],
	["RRPClient_util_playerEquipment_remove",				"rimas_agent\code\util_playerCargo\RRPClient_util_playerEquipment_remove.sqf"],
	["RRPClient_util_playerEquipment_serialize",			"rimas_agent\code\util_playerCargo\RRPClient_util_playerEquipment_serialize.sqf"],

	["gui_fnc_export"				,						"rimas_agent\overwrites\gui_fnc_export.sqf"],
	["gui_fnc_exportdefine"			,						"rimas_agent\overwrites\gui_fnc_exportdefine.sqf"],
	["gui_fnc_exportparents"		,						"rimas_agent\overwrites\gui_fnc_exportparents.sqf"],
	["gui_fnc_exportstringtable"	,						"rimas_agent\overwrites\gui_fnc_exportstringtable.sqf"],

	['getSide', 											'rimas_agent\code\getSide.sqf'],
	["RRPClient_system_danceGrenade",						"rimas_agent\code\RRPClient_system_danceGrenade.sqf"],
	['SmartClient_gui_hud_renderWaypoints', 				'rimas_agent\code\toasts\SmartClient_gui_hud_renderWaypoints.sqf'],
	['SmartClient_gui_map_event_onDraw', 					'rimas_agent\code\toasts\SmartClient_gui_map_event_onDraw.sqf'],
	['SmartClient_gui_map_event_onKeyDown', 				'rimas_agent\code\toasts\SmartClient_gui_map_event_onKeyDown.sqf'],
	['SmartClient_gui_map_event_onMouseButtonDown', 		'rimas_agent\code\toasts\SmartClient_gui_map_event_onMouseButtonDown.sqf'],
	['SmartClient_gui_map_event_onMouseButtonUp', 			'rimas_agent\code\toasts\SmartClient_gui_map_event_onMouseButtonUp.sqf'],
	['SmartClient_gui_toaster_addTemplateToast', 			'rimas_agent\code\toasts\SmartClient_gui_toaster_addTemplateToast.sqf'],
	['SmartClient_gui_toaster_addToast', 					'rimas_agent\code\toasts\SmartClient_gui_toaster_addToast.sqf'],
	['SmartClient_gui_toaster_removeAllToasts', 			'rimas_agent\code\toasts\SmartClient_gui_toaster_removeAllToasts.sqf'],
	['SmartClient_gui_toaster_thread', 						'rimas_agent\code\toasts\SmartClient_gui_toaster_thread.sqf'],
	['SmartClient_gui_evh_draw3D', 							'rimas_agent\code\toasts\SmartClient_gui_evh_draw3D.sqf'],
	['SmartClient_gui_toaster_toggle', 						'rimas_agent\code\toasts\SmartClient_gui_toaster_toggle.sqf'],

	["RRPClient_holdAction_Add",							"rimas_agent\code\holdAction\RRPClient_holdAction_Add.sqf"],
	["RRPClient_holdAction_AnimationState",					"rimas_agent\code\holdAction\RRPClient_holdAction_AnimationState.sqf"],
	["RRPClient_holdAction_IconChangeState",				"rimas_agent\code\holdAction\RRPClient_holdAction_IconChangeState.sqf"],

	["RRPClient_CCTV_camAction",							"rimas_agent\code\CCTV\RRPClient_CCTV_camAction.sqf"],
	["RRPClient_CCTV_loadInfo",								"rimas_agent\code\CCTV\RRPClient_CCTV_loadInfo.sqf"],
	["RRPClient_CCTV_onCameraDropDownChanged",				"rimas_agent\code\CCTV\RRPClient_CCTV_onCameraDropDownChanged.sqf"],
	["RRPClient_CCTV_onLoad",								"rimas_agent\code\CCTV\RRPClient_CCTV_onLoad.sqf"],
	["RRPClient_CCTV_onMouseButtonDown",					"rimas_agent\code\CCTV\RRPClient_CCTV_onMouseButtonDown.sqf"],
	["RRPClient_CCTV_onMouseButtonUp",						"rimas_agent\code\CCTV\RRPClient_CCTV_onMouseButtonUp.sqf"],
	["RRPClient_CCTV_onMouseMoving",						"rimas_agent\code\CCTV\RRPClient_CCTV_onMouseMoving.sqf"],
	["RRPClient_CCTV_onMouseZChanged",						"rimas_agent\code\CCTV\RRPClient_CCTV_onMouseZChanged.sqf"],
	["RRPClient_CCTV_onUnLoad",								"rimas_agent\code\CCTV\RRPClient_CCTV_onUnLoad.sqf"],
	["RRPClient_CCTV_show",									"rimas_agent\code\CCTV\RRPClient_CCTV_show.sqf"],
	["RRPClient_CCTV_toggleCameraScreen",					"rimas_agent\code\CCTV\RRPClient_CCTV_toggleCameraScreen.sqf"],
	["RRPClient_CCTV_event_onFiredNear",					"rimas_agent\code\CCTV\RRPClient_CCTV_event_onFiredNear.sqf"],

	["RRPClient_discord_drpc_Init",							"rimas_agent\code\drpc\RRPClient_discord_drpc_Init.sqf"],
	["RRPClient_discord_drpc_update",						"rimas_agent\code\drpc\RRPClient_discord_drpc_update.sqf"],


	["CAU_animate_fnc_add",									"rimas_agent\code\animate_paa\CAU_animate_fnc_add.sqf"],
	["CAU_animate_fnc_addGlobal",							"rimas_agent\code\animate_paa\CAU_animate_fnc_addGlobal.sqf"],
	["CAU_animate_fnc_eachFrameClient",						"rimas_agent\code\animate_paa\CAU_animate_fnc_eachFrameClient.sqf"],
	["CAU_animate_fnc_eachFrameServer",						"rimas_agent\code\animate_paa\CAU_animate_fnc_eachFrameServer.sqf"],
	["CAU_animate_fnc_init",								"rimas_agent\code\animate_paa\CAU_animate_fnc_init.sqf"],
	["CAU_animate_fnc_remove",								"rimas_agent\code\animate_paa\CAU_animate_fnc_remove.sqf"],
	["CAU_animate_fnc_removeGlobal",						"rimas_agent\code\animate_paa\CAU_animate_fnc_removeGlobal.sqf"],

	//Gui Util
	["RRPClient_gui_util_randomColors",						"rimas_agent\code\gui_util\RRPClient_gui_util_randomColors.sqf"],
	["RRPClient_gui_util_parallax",							"rimas_agent\code\gui_util\RRPClient_gui_util_parallax.sqf"],
	["RRPClient_gui_util_extendedUI",						"rimas_agent\code\gui_util\RRPClient_gui_util_extendedUI.sqf"],
	["RRPClient_gui_util_makeAnchor",						"rimas_agent\code\gui_util\RRPClient_gui_util_makeAnchor.sqf"],
	["RRPClient_gui_util_makeBackground",					"rimas_agent\code\gui_util\RRPClient_gui_util_makeBackground.sqf"],
	["RRPClient_gui_util_makeCheckbox",						"rimas_agent\code\gui_util\RRPClient_gui_util_makeCheckbox.sqf"],
	["RRPClient_gui_util_makeCombo",						"rimas_agent\code\gui_util\RRPClient_gui_util_makeCombo.sqf"],
	["RRPClient_gui_util_makeCustom",						"rimas_agent\code\gui_util\RRPClient_gui_util_makeCustom.sqf"],
	["RRPClient_gui_util_makeEditBox",						"rimas_agent\code\gui_util\RRPClient_gui_util_makeEditBox.sqf"],
	["RRPClient_gui_util_makeHTML",							"rimas_agent\code\gui_util\RRPClient_gui_util_makeHTML.sqf"],
	["RRPClient_gui_util_makeList",							"rimas_agent\code\gui_util\RRPClient_gui_util_makeList.sqf"],
	["RRPClient_gui_util_makeLoad",							"rimas_agent\code\gui_util\RRPClient_gui_util_makeLoad.sqf"],
	["RRPClient_gui_util_makePicButton",					"rimas_agent\code\gui_util\RRPClient_gui_util_makePicButton.sqf"],
	["RRPClient_gui_util_makePicToggle",					"rimas_agent\code\gui_util\RRPClient_gui_util_makePicToggle.sqf"],
	["RRPClient_gui_util_makeProgress",						"rimas_agent\code\gui_util\RRPClient_gui_util_makeProgress.sqf"],
	["RRPClient_gui_util_makeSimpleButton",					"rimas_agent\code\gui_util\RRPClient_gui_util_makeSimpleButton.sqf"],
	["RRPClient_gui_util_makeSlider",						"rimas_agent\code\gui_util\RRPClient_gui_util_makeSlider.sqf"],
	["RRPClient_gui_util_makeStaticPicture",				"rimas_agent\code\gui_util\RRPClient_gui_util_makeStaticPicture.sqf"],
	["RRPClient_gui_util_makeStructuredText",				"rimas_agent\code\gui_util\RRPClient_gui_util_makeStructuredText.sqf"],
	["RRPClient_gui_util_updateStructuredText",				"rimas_agent\code\gui_util\RRPClient_gui_util_updateStructuredText.sqf"],
	["RRPClient_gui_util_loopVideo",						"rimas_agent\code\gui_util\RRPClient_gui_util_loopVideo.sqf"],
	["RRPClient_gui_util_smoothlyOpen",						"rimas_agent\code\gui_util\RRPClient_gui_util_smoothlyOpen.sqf"],
	["RRPClient_gui_util_blur",								"rimas_agent\code\gui_util\RRPClient_gui_util_blur.sqf"],
	["RRPClient_gui_arsenalCamera",							"rimas_agent\code\gui_util\RRPClient_gui_arsenalCamera.sqf"],
	["RRPClient_gui_npc_openDialog",						"rimas_agent\code\gui_util\RRPClient_gui_npc_openDialog.sqf"],

	["RRPClient_gui_util_animButton_onButtonDown",			"rimas_agent\code\gui_util\RRPClient_gui_util_animButton_onButtonDown.sqf"],
	["RRPClient_gui_util_animButton_onButtonUp",			"rimas_agent\code\gui_util\RRPClient_gui_util_animButton_onButtonUp.sqf"],
	["RRPClient_gui_util_animButton_onMouseMoving",			"rimas_agent\code\gui_util\RRPClient_gui_util_animButton_onMouseMoving.sqf"],
	["RRPClient_gui_util_mouseControl_buildLimits",			"rimas_agent\code\gui_util\RRPClient_gui_util_mouseControl_buildLimits.sqf"],
	["RRPClient_gui_util_mouseControl_inLimit",				"rimas_agent\code\gui_util\RRPClient_gui_util_mouseControl_inLimit.sqf"],

	["RRPClient_gui_util_createLayer",						"rimas_agent\code\RRPClient_gui_util_createLayer.sqf"],

	["RRPClient_gui_baguette_show",							"rimas_agent\code\RRPClient_gui_baguette_show.sqf"],
	["RRPClient_gui_baguette_toggle",						"rimas_agent\code\RRPClient_gui_baguette_toggle.sqf"],
	["RRPClient_gui_baguetteExt_show",						"rimas_agent\code\RRPClient_gui_baguetteExt_show.sqf"],
	["RRPClient_gui_baguetteExt_toggle",					"rimas_agent\code\RRPClient_gui_baguetteExt_toggle.sqf"],
	["RRPClient_event_onAnimDone",							"rimas_agent\code\RRPClient_event_onAnimDone.sqf"],
	["RRPClient_npc_spawnUnits",							"rimas_agent\code\RRPClient_npc_spawnUnits.sqf"],
	["RRPClient_util_gear_getCompatibleWeaponItems", 		"rimas_agent\code\RRPClient_util_gear_getCompatibleWeaponItems.sqf"],
	["RRPClient_util_array_toLower", 						"rimas_agent\code\RRPClient_util_array_toLower.sqf"],
	["RRPClient_util_dateCompare", 							"rimas_agent\code\RRPClient_util_dateCompare.sqf"],
	["RRPClient_util_compileSecFinal", 						"rimas_agent\code\RRPClient_util_compileSecFinal.sqf"],
	["RRPClient_util_prompt", 								"rimas_agent\code\RRPClient_util_prompt.sqf"],
	["RRPClient_util_push_lifeVehicles", 					"rimas_agent\code\RRPClient_util_push_lifeVehicles.sqf"],
	["RRPClient_util_readCacheValues", 						"rimas_agent\code\RRPClient_util_readCacheValues.sqf"],
	["RRPClient_util_addAndCalculateTax", 					"rimas_agent\code\RRPClient_util_addAndCalculateTax.sqf"],
	["RRPClient_util_attachedObjectsPlayer",				"rimas_agent\code\RRPClient_util_attachedObjectsPlayer.sqf"],
	["RRPClient_util_checkASCII", 							"rimas_agent\code\RRPClient_util_checkASCII.sqf"],
	["RRPClient_util_checkParkour", 						"rimas_agent\code\RRPClient_util_checkParkour.sqf"],
	["RRPClient_util_checkWrongChars",						"rimas_agent\code\RRPClient_util_checkWrongChars.sqf"],
	["RRPClient_util_conditionsCheck",						"rimas_agent\code\RRPClient_util_conditionsCheck.sqf"],
	["RRPClient_util_containerCargo_add", 					"rimas_agent\code\RRPClient_util_containerCargo_add.sqf"],
	["RRPClient_util_containerCargo_canAdd", 				"rimas_agent\code\RRPClient_util_containerCargo_canAdd.sqf"],
	["RRPClient_util_containerCargo_clear", 				"rimas_agent\code\RRPClient_util_containerCargo_clear.sqf"],
	["RRPClient_util_containerCargo_deserialize", 			"rimas_agent\code\RRPClient_util_containerCargo_deserialize.sqf"],
	["RRPClient_util_containerCargo_list", 					"rimas_agent\code\RRPClient_util_containerCargo_list.sqf"],
	["RRPClient_util_containerCargo_remove", 				"rimas_agent\code\RRPClient_util_containerCargo_remove.sqf"],
	["RRPClient_util_containerCargo_serialize", 			"rimas_agent\code\RRPClient_util_containerCargo_serialize.sqf"],
	["RRPClient_util_containsForbiddenCharacter", 			"rimas_agent\code\RRPClient_util_containsForbiddenCharacter.sqf"],
	["RRPClient_util_convertHexToRGB",						"rimas_agent\code\RRPClient_util_convertHexToRGB.sqf"],
	["RRPClient_util_convertTime",							"rimas_agent\code\RRPClient_util_convertTime.sqf"],
	["RRPClient_util_copyToClipboard",						"rimas_agent\code\RRPClient_util_copyToClipboard.sqf"],
	["RRPClient_util_dateToString", 						"rimas_agent\code\RRPClient_util_dateToString.sqf"],
	["RRPClient_util_dikToHuman", 							"rimas_agent\code\RRPClient_util_dikToHuman.sqf"],
	["RRPClient_util_exponentToString", 					"rimas_agent\code\RRPClient_util_exponentToString.sqf"],
	["RRPClient_util_find", 								"rimas_agent\code\RRPClient_util_find.sqf"],
	["RRPClient_util_generateRandomString", 				"rimas_agent\code\RRPClient_util_generateRandomString.sqf"],
	["RRPClient_util_calculateLoad", 						"rimas_agent\code\RRPClient_util_calculateLoad.sqf"],
	["RRPClient_util_getMass", 								"rimas_agent\code\RRPClient_util_getMass.sqf"],
	["RRPClient_util_getConfigNameByClassName", 			"rimas_agent\code\RRPClient_util_getConfigNameByClassName.sqf"],
	["RRPClient_util_getBuildingInside", 					"rimas_agent\code\RRPClient_util_getBuildingInside.sqf"],
	["RRPClient_util_getLoadedMagazinesMap", 				"rimas_agent\code\RRPClient_util_getLoadedMagazinesMap.sqf"],
	["RRPClient_util_getMagazineMap", 						"rimas_agent\code\RRPClient_util_getMagazineMap.sqf"],
	["RRPClient_util_getMap", 								"rimas_agent\code\RRPClient_util_getMap.sqf"],
	["RRPClient_util_globalSound", 							"rimas_agent\code\RRPClient_util_globalSound.sqf"],
	["RRPClient_util_isAddonsConfigCheck", 					"rimas_agent\code\RRPClient_util_isAddonsConfigCheck.sqf"],
	["RRPClient_util_isInStratis",							"rimas_agent\code\RRPClient_util_isInStratis.sqf"],
	["RRPClient_util_logArray", 							"rimas_agent\code\RRPClient_util_logArray.sqf"],
	["RRPClient_util_monthToString", 						"rimas_agent\code\RRPClient_util_monthToString.sqf"],
	["RRPClient_util_objectFromPlayerUID", 					"rimas_agent\code\RRPClient_util_objectFromPlayerUID.sqf"],
	["RRPClient_util_repackMagazines", 						"rimas_agent\code\RRPClient_util_repackMagazines.sqf"],
	["RRPClient_util_scalarToString", 						"rimas_agent\code\RRPClient_util_scalarToString.sqf"],
	["RRPClient_util_selectRandom", 						"rimas_agent\code\RRPClient_util_selectRandom.sqf"],
	["RRPClient_util_stripChars",							"rimas_agent\code\RRPClient_util_stripChars.sqf"],
	["RRPClient_util_drawToMap", 							"rimas_agent\code\RRPClient_util_drawToMap.sqf"],
	["RRPClient_util_fetchVehInfo", 						"rimas_agent\code\RRPClient_util_fetchVehInfo.sqf"],
	["RRPClient_util_getModelName", 						"rimas_agent\code\RRPClient_util_getModelName.sqf"],
	["RRPClient_util_getplayeritems", 						"rimas_agent\code\RRPClient_util_getplayeritems.sqf"],
	["RRPClient_util_itemCount", 							"rimas_agent\code\RRPClient_util_itemCount.sqf"],
	["RRPClient_util_itemDetails", 							"rimas_agent\code\RRPClient_util_itemDetails.sqf"],
	["RRPClient_util_numberText", 							"rimas_agent\code\RRPClient_util_numberText.sqf"],
	["RRPClient_util_stripDownPlayer", 						"rimas_agent\code\RRPClient_util_stripDownPlayer.sqf"],
	["RRPClient_util_xString", 								"rimas_agent\code\RRPClient_util_xString.sqf"],
	["RRPClient_util_isSaveItem", 							"rimas_agent\code\RRPClient_util_isSaveItem.sqf"],
	["RRPClient_util_uuid", 								"rimas_agent\code\RRPClient_util_uuid.sqf"],

	["RRPClient_gui_loadingScreen_updateText", 				"rimas_agent\code\RRPClient_gui_loadingScreen_updateText.sqf"],
	["RRPClient_init_agent_preInit", 						"rimas_agent\code\RRPClient_init_agent_preInit.sqf"],
	["RRPClient_gui_init_ppEffects", 						"rimas_agent\code\RRPClient_gui_init_ppEffects.sqf"],
	["RRPClient_session_startSessionResponse", 				"rimas_agent\code\RRPClient_session_startSessionResponse.sqf"],
	["RRPClient_util_math_getPositionInDirection", 			"rimas_agent\code\RRPClient_util_math_getPositionInDirection.sqf"],
	["RRPClient_util_log", 									"rimas_agent\code\RRPClient_util_log.sqf"],
	["RRPClient_gui_htmlLoad", 								"rimas_agent\code\RRPClient_gui_htmlLoad.sqf"],
	["RRPClient_system_loadGearIntro", 						"rimas_agent\code\RRPClient_system_loadGearIntro.sqf"],
	["RRPClient_util_ambientAnim", 							"rimas_agent\code\RRPClient_util_ambientAnim.sqf"],
	["RRPClient_util_math_getRandomPositionInCircle", 		"rimas_agent\code\RRPClient_util_math_getRandomPositionInCircle.sqf"],
	["RRPClient_util_world_getRandomPositionInCircleMarker","rimas_agent\code\RRPClient_util_world_getRandomPositionInCircleMarker.sqf"],
	["RRPClient_util_world_isInHuntingRange", 				"rimas_agent\code\RRPClient_util_world_isInHuntingRange.sqf"],
	["RRPClient_util_world_isAlivePlayerInRange", 			"rimas_agent\code\RRPClient_util_world_isAlivePlayerInRange.sqf"],
	["RRPClient_VR_rotationSpeed",							"rimas_agent\code\RRPClient_VR_rotationSpeed.sqf"]
];
call RRPClient_init_agent_preInit;
true
