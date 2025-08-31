disableSerialization;
private _display=uiNamespace getVariable["RRPDialogTablet", displayNull];
private _mainGroup=_display displayCtrl 24001;
private _slide=_mainGroup controlsGroupCtrl 30000;
private _vehicles=_slide controlsGroupCtrl 3002;
private _pList=_slide controlsGroupCtrl 3005;
lbClear _vehicles;
lbClear _pList;
_near_units=[];
{
	if (player distance _x < 20) then {
		_near_units pushBack _x
	};
}forEach playableUnits;
for"_i"from 0 to(count life_vehicles)-1 do{
	_veh=life_vehicles select _i;
	if (!isNull _veh && alive _veh) then {
		_text="";
		if(!isNil{
			_veh getVariable"Life_VEH_color"
		}) then{
			_color=_veh getVariable["Life_VEH_color", ""];
			if (isClass(missionConfigFile>>"LifeCfgVehTextures">>_color)) then {
				_text=format[" (%1)", getText(getMissionConfig"LifeCfgVehTextures">>_color>>"displayName")];
			};
		};
		_name=getText(configFile>>"CfgVehicles">>(typeOf _veh)>>"displayName");
		_pic=getText(configFile>>"CfgVehicles">>(typeOf _veh)>>"picture");
		_distance = round(player distance _veh);
		_vehicles lbAdd format["%1%3 - [Расстояние: %2]", _name, if (_distance > 99) then {"Далеко"}else{format ["%1 м.",_distance]}, _text];
		if (_pic!="pictureStaticObject") then {
			_vehicles lbSetPicture[(lbSize _vehicles)-1, _pic];
		};
		_vehicles lbSetData[(lbSize _vehicles)-1, str(_i)];
	};
};
for"_i"from 0 to(count life_tempHouses)-1 do{
	_veh=life_tempHouses select _i;
	if (!isNull _veh&&alive _veh) then {
		_name=getText(configFile>>"CfgVehicles">>(typeOf _veh)>>"displayName");
		_pic=getText(configFile>>"CfgVehicles">>(typeOf _veh)>>"picture");
		_vehicles lbAdd format["%1 - [ВЗЛОМАН] - [Расстояние: %2m]", _name, round(player distance _veh)];
		if (_pic!="pictureStaticObject") then {
			_vehicles lbSetPicture[(lbSize _vehicles)-1, _pic];
		};
		_vehicles lbSetData[(lbSize _vehicles)-1, ""];
	};
};
{
	_indexInIds=[(getPlayerUID _x), life_ids]call RRPClient_system_index;
	if (!isNull _x && alive _x && player distance _x < 20 && _x != player && (_x getVariable["realname", ""] != "") && (_indexInIds!=-1 or _x in (units (group player)))) then {
		_plist lbAdd format["%1 - %2", _x call getFullName, _x call getSide];
		_plist lbSetData[(lbSize _plist)-1, netID _x];
	};
}forEach _near_units;
if (((lbSize _vehicles)-1) == -1) then {
	_vehicles lbAdd"У вас нет ключей";
	_vehicles lbSetData[(lbSize _vehicles)-1, str(objNull)];
};