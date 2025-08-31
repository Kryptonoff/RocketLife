
private ["_display","_vehicles","_plist","_near_units","_pic","_name","_text","_color","_index"];
disableSerialization;
createDialog "RRPDialogSwapVehicle";

_display = findDisplay 2700;
{
	[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
}forEach allControls _display;

(_display displayCtrl 2704) ctrlSetText "Цена";

_vehicles = _display displayCtrl 2701;
lbClear _vehicles;
_plist = _display displayCtrl 2702;
lbClear _plist;
_near_units = [];

{ if (player distance _x < 20) then {_near_units pushBack _x};} forEach playableUnits;

for "_i" from 0 to (count life_vehicles)-1 do 
{
    _veh = life_vehicles select _i;
    if (!isNull _veh && {alive _veh} && {(_veh isKindOf "Car")} || {(_veh isKindOf "Air")} || {(_veh isKindOf "Ship")}) then 
	{
		if !(isNil {_veh getVariable "dbInfo"}) then
		{
			if (((_veh getVariable "dbInfo") select 0) isEqualTo (getPlayerUID player)) then
			{
				_text = "";
				if (!isNil {_veh getVariable "Life_VEH_color"}) then {
					_color = _veh getVariable ["Life_VEH_color",""];
					if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _color)) then 
					{
						_text = format[" (%1)",getText (missionConfigFile >> "LifeCfgVehTextures" >> _color >> "displayName")];
					};
				};
				_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
				_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
				_idx = _vehicles lbAdd format ["%1 %3 - [Дистанция: %2m]",_name,round(player distance _veh),_text];
				if (_pic != "pictureStaticObject") then 
				{
					_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
				};
				_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
				_vehicles lbSetValue [_idx,(_veh getVariable ["vehicle_info_vid",0])];
			};
		};
    };
};

{
    if (!isNull _x && {alive _x} && {player distance _x < 20} && {!(_x isEqualTo player)} ) then 
	{
        _plist lbAdd format ["Игрок - %1",_x call getNickName];
        _plist lbSetData [(lbSize _plist)-1,str(_x)];
    };
} forEach _near_units;

if (((lbSize _vehicles)-1) isEqualTo -1) then 
{
    _vehicles lbAdd "Нету владельца";
    _vehicles lbSetData [(lbSize _vehicles)-1,""];
};