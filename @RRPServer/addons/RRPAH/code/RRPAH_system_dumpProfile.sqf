/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

_vCode = [];  
_vString = [];  
_vArray = [];
_ignore=["bis_fnc_saveinventory_data","epoch_togglevars","life_mythemeid","babe_em_settings_vehicleinteraction","prns_fakepassportsession","ace_versionnumberstring","prns_serversession","babe_em_keys_climb","gui_v3_txt_html","infistar_keybinds_saved","prns_arc_currentzones","ffa_templates_vanila_east","mav_taxi_v_taximeterposition","amazingroleplay_tabletsettings_activelayout","amazing_settings","kothv","ace_atragmx_gunlist","ft2_preset_default_east_1","ripwestloadoutssave","zmeszulu_main","cba_settings_hash","cba_keybinding_registrynew","prns_conversationsdata","bis_fnc_camera_positions","ffa_view_distance","evor_var_savedloadout","evor_var_savedpurchase","gearforintro","cba_keybinding_registry_v3","cba_settings_presetshash","cba_settings_autosavedpresets","map_unknown_presetdefault","subtitles_text_presetdefault","igui_text_rgb_preset","map_independent_presetdefault","map_unknown_preset","iguipresetdefault","igui_warning_rgb_presetdefault","map_blufor_presetdefault","guipresetdefault","map_blufor_preset","igui_tactping_rgb_presetdefault","igui_tactping_rgb_preset","igui_error_rgb_preset","map_civilian_presetdefault","iguipreset","gui_titletext_rgb_presetdefault","igui_bcg_rgb_presetdefault","igui_error_rgb_presetdefault","map_opfor_presetdefault","subtitles_background_preset","guipreset","igui_text_rgb_presetdefault","map_opfor_preset","subtitles_background_presetdefault","subtitles_text_preset","gui_bcg_rgb_preset","gui_titletext_rgb_preset","gui_bcg_rgb_presetdefault","igui_bcg_rgb_preset","map_independent_preset","igui_warning_rgb_preset","map_civilian_preset"];
{  
	if !(_x in _ignore) then
	{
	 if ((profileNamespace getVariable _x) isEqualType {}) then  
	 {  
	  _vCode pushBack _x;  
	  ['Код в переменной!','SpyGlass','FF0000',format ["%1 - %2 (%3) - %4",_x,(name player),getPlayerUID player,profileNamespace getVariable _x]] remoteExecCall ["RRPServer_discord_sendMessage",2];
	  [format["Code in variable - %1 (%2)",_x,profileNamespace getVariable _x]] call RRPClient_system_c834y9wq;
	 };  
	 if ((profileNamespace getVariable _x) isEqualType "") then  
	 {  
	  _vCode pushBack [_x,(profileNamespace getVariable _x) select [0,25]];  
	 };
	 if ((profileNamespace getVariable _x) isEqualType []) then
	 {
		_vArray pushBack [_x,(profileNamespace getVariable _x) select [0,100]];
	 };
	};
}forEach (parsingNamespace getVariable "profVars");
[format ["%2(%3) - %1",(_vCode + _vString + _vArray),profileName,getPlayerUID player], "VariableLog"] remoteExecCall ["RRPServer_system_logIt",2];

_dropVariable = ["cba_diagnostic_statements","rscdebugconsole_expression"];
{
	if !(isNil {profileNamespace getVariable _x}) then
	{
		if (((_x isEqualType []) and {!(_x isEqualTo [])}) or ((_x isEqualType "") and {!(_x isEqualTo "")})) then
		{
			['Обнаружена запрещенная переменная','Vars','FFFF00',format ["Переменная аннулирована: %1 - %2 (%3) Данные переменной: %4",_x,(name player),getPlayerUID player,profileNamespace getVariable _x]] remoteExecCall ["RRPServer_discord_sendMessage",2];
			profileNamespace setVariable [_x,nil];
			saveProfileNamespace;
		};
	};
}forEach _dropVariable;
