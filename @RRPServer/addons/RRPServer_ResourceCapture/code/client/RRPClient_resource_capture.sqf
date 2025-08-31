
private _vendor = param [0,objNull,[objNull]];

try{
	if (player call getSide in ["cop","med"]) throw "Вы служите и не можете захватывать переработку";
	if !(isNull (objectParent player)) throw "Покиньте транспорт";
	if !(vehicleVarName _vendor isEqualTo ((enabledCaptures select BattleIndex) select 0)) throw "За эту переработку сейчас битва не ведется";
	if (RRPClientGroupInfo isEqualTo []) throw "Захват переработки доступен только премиальным организациям";

	private _vendorTitle = switch (_vendor) do {
		case coke_processor: {localize "STR_Item_Cocaine"};
		case mari_processor: {localize "STR_Item_Marijuana"};
		case heroin_processor: {localize "STR_Item_Heroin"};
		case meth_processor: {localize "STR_Item_Meth"};
		case uran_processor: {localize "STR_MF_ResGathUranus"};
		case uran_processor_clean: {localize "STR_MF_ResGathUranus"};
	};

	_captureCode = {
		params ["_vendor","_vendorTitle"];
		[_vendor,"inCapture",true] call CBA_fnc_setVarNet;
		["Битва за ресурс!",format["Организация %1 начала захват переработки %2!",RRPClientGroupInfo get "name",_vendorTitle]] remoteExecCall ["RRPClient_gui_baguetteExt_show",-2];
		
		private _complete = [
			"Захват ресурса",
			{(BattleIndex isEqualTo -1) OR {((getposWorld player) distance (getposWorld _vendor) > 10)}},
			true,
			900,
			false,
			true
		] call RRPClient_system_newProgressBar;

		if (isNil "_complete") throw "Захват прерван!";
  		if !(_complete) throw "Захват прерван!";
		
		//TODO: While capture
		// old code = ["Захват ресурса",900,"","",true,{(BattleIndex isEqualTo -1) OR ((getpos player) distance (getpos _vendor) > 10)}] call RRPClient_system_progressBar;
		////////////////////////////////////////////
		
		[_vendor,"inCapture"] call RRPClient_system_clearGlobalVar;
		if (call RRPClient_system_isInterrupted) throw "Захват отменен";
		["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;
	
		if (life_interrupted) then 
		{
			life_interrupted = false; 
			throw "Действие отменено";
		};
		if ((BattleIndex isEqualTo -1) OR {((getPosWorld player) distance (getPosWorld _vendor) > 10)}) throw "Действие отменено";
		[_vendor,"canProcess",[]] call CBA_fnc_setVarNet;

		["Битва за ресурс!",format["Организация %1 взяла под контроль переработку %2!",RRPClientGroupInfo get "name",_vendorTitle]] remoteExecCall ["RRPClient_gui_baguetteExt_show",-2];
		[group player,vehicleVarName _vendor] remoteExec ["RRPServer_resource_capture_endBattle",2];
	
	};

	[
		(findDisplay 46),
		_captureCode,[_vendor,_vendorTitle],
		"Захватить переработку?",
		format ["Начать захватывать переработку %1?",_vendorTitle]
	]call RRPClient_util_prompt;

}catch{
	["ErrorTitleAndText",["Битва за ресурс", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true


