disableSerialization;
private _display = uiNamespace getVariable ["playerHUD",displayNull];
if (isNull _display) then {
	["RRPHUD","PLAIN",1,false] call RRPClient_gui_CreateRscLayer;
	_display = uiNamespace getVariable ["playerHUD",displayNull];

};
private _group = _display displayCtrl 1999;
_createGradient = {
	params [["_control",controlNull]];
	if (isNull _control) exitWith {};
	private _ctrlGradient = [ctrlParentControlsGroup _control, -1, ctrlPosition _control,"\A3\ui_f\data\igui\rscingameui\rscunitinfo\gradient_ca.paa",false,true,[0.1,0.1,0.1,0.45]] call RRPClient_gui_util_makeStaticPicture;
	_ctrlGradient ctrlSetAngle [180,0.5,0.5,true];
	_ctrlGradient
};
private _statCtrl = _group controlsGroupCtrl 2011;

private _pbStamina = _group controlsGroupCtrl 2001;
private _pbStaminaGrad = [_pbStamina] call _createGradient;

private _pbHp = _group controlsGroupCtrl 2002;
private _pbHpGrad = [ _pbHp] call _createGradient;

private _pbEat = _group controlsGroupCtrl 2003;
private _pbEatGrad = [ _pbEat] call _createGradient;

private _pbDrink = _group controlsGroupCtrl 2004;
private _pbDrinkGrad = [ _pbDrink] call _createGradient;

private _iconStamina = _group controlsGroupCtrl 2006;

private _pbTfar = _group controlsGroupCtrl 2009;

private _pbXPText = _group controlsGroupCtrl 2013;
private _pbXP = _group controlsGroupCtrl 2012;
private _pbXPGrad = [_pbXP] call _createGradient;

private _vehicleGroup = _display displayCtrl 23200;
private _fuelProgress = _vehicleGroup controlsGroupCtrl 23201;
private _fuelProgressGrad = [_fuelProgress] call _createGradient;
private _speedText = _vehicleGroup controlsGroupCtrl 23204;
private _speedTextBackground = _vehicleGroup controlsGroupCtrl 23210;
private _speedTextGrad = [_speedTextBackground] call _createGradient;
private _vehicleName = _vehicleGroup controlsGroupCtrl 23208;
private _vehicleDistance = _vehicleGroup controlsGroupCtrl 23209;

private _w = (0.0889536 * safezoneW);

private _dailiesGroup = _display displayCtrl 23100;
private _dg_Ttiletext = _dailiesGroup controlsGroupCtrl 23101;
private _dg_text = _dailiesGroup controlsGroupCtrl 23105;
_dailiesGroup ctrlShow life_showCaseTimer;


private _updateXP = {
	private _w = 0.102331 * safezoneW;
	_xp = VRP_XP;
	_nextXP = [VRP_Level] call RRPClient_perks_getRequiredXP;
	_pbXP ctrlSetPositionW (((_xp / _nextXP) * _w) min _w);
	_pbXP ctrlSetBackgroundColor [0,0.92,0.99,0.8];
	_pbXPText ctrlSetStructuredText parseText format ["<t shadow='1' size='.8'><t align='left'>%1</t><t align='center'>%2/%3</t><t align='right'>%4</t></t>",VRP_Level,_xp,_nextXP,(VRP_Level + 1) min ([] call RRPClient_perks_getMaxLevel)];
	_pbXP ctrlCommit 0;
};

private _updateDailies = {
	_totalTime = player getVariable ["PlayerTime",0];
	_estimatedTimeForCase = 180 - (_totalTime mod 180);

	_estimatedHours = floor (_estimatedTimeForCase / 60);
	_estimatedMinutes = _estimatedTimeForCase mod 60;

	_estimatedHoursText = "";
	if (_estimatedHours > 0) then {_estimatedHoursText = format ["%1 ч. ", _estimatedHours]};
	_dg_text ctrlSetStructuredText parseText (format ["<t font='SFProDisplay' valign='bottom' align='right'>"+
	"<t size='1.1'>Отыграй 3 часа</t><br/>"+
	"<t size='1'>И получи <t font='SFCompactTextItalic' underline='1'>Free Case</t></t><br/>"+
	"<t size='1.3' font='SFCompactTextItalic' color='#00EBFC'>%1%2 мин.</t>" +
	"</t>", _estimatedHoursText, _estimatedMinutes]);
};

private _flash = {
	params ["_ctrl"];
	if (_ctrl getVariable ['Flash',false]) exitWith {};
	_ctrl setVariable ['Flash',true];
	_ctrl ctrlSetTextColor [1,0,0,0.45];
	for '_i' from 1 to 0 step -0.01 do {
		_ctrl ctrlSetTextColor [_i,0,0,0.45];
		uiSleep 0.0075;
	};
	_ctrl setVariable ['Flash',false];
};

private _updateFood = {
	_hunger = RRPClientHunger / 100;
	if (_hunger <= 0.4) then {[_pbEatGrad] spawn _flash};
	_pbEat ctrlSetPositionW ((_hunger * _w) min _w);
	_pbEat ctrlSetBackgroundColor [1 - (RRPClientHunger / 100),(_hunger * 0.92),0.99,0.8];
	_pbEat ctrlCommit 0;
};

private _updateDrink = {
	_drink = RRPClientThirst / 100;
	if (_drink <= 0.4) then {[_pbDrinkGrad] spawn _flash};
	_pbDrink ctrlSetPositionW ((_drink * _w) min _w);
	_pbDrink ctrlSetBackgroundColor [1 - (RRPClientThirst / 100),(_drink * 0.92),0.99,0.8];
	_pbDrink ctrlCommit 0;
};

private _updateHealth = {
	_damage = (1 - (damage player));
	if (_damage <= 0.5) then {[_pbHpGrad] spawn _flash};
	_pbHp ctrlSetPositionW ((_damage * _w) min _w);
	_pbHp ctrlSetBackgroundColor [damage player,(_damage * 0.92),0.99,0.8];
	_pbHp ctrlCommit 0;
};

private _updateStamina = {
	_stamina = (1 - getFatigue player);
	if ((ctrlText _iconStamina) isNotEqualTo "\rimas_agent\assets\hud\stamina.paa") then {_iconStamina ctrlSetText "\rimas_agent\assets\hud\stamina.paa"};
	if (_stamina <= 0.25) then {[_pbStaminaGrad] spawn _flash};

	_pbStamina ctrlSetPositionW ((_stamina * _w) min _w);
	_pbStamina ctrlSetBackgroundColor [getFatigue player,(_stamina * 0.92),0.99,0.8];
	_pbStamina ctrlCommit 0;
};

private _updateRadio = {
	_image = format ["\rimas_agent\assets\hud\tfar_%1.paa",TF_speak_volume_meters];
	_pbTfar ctrlSetText _image;
};

private _updateSpeakerColor = {
	_pbTfar ctrlSetTextColor (
		if (player getVariable ["tf_isSpeaking",false]) then {
				[1,1,1,1]
		}else{
			[1,1,1,0.5]
		});
	
};

_wFuel = 0.192309 * safezoneW;
private _updateVehicle = {
	_vehicle = objectParent player;
	if (isNull _vehicle) exitWith {};
	_fuel = fuel _vehicle;
	if (_fuel <= 0.25) then {[_fuelProgressGrad] spawn _flash};
	_fuelProgress ctrlSetPositionW ((_fuel * _wFuel) min _wFuel);
	_fuelProgress ctrlSetBackgroundColor [0,(_fuel * 0.92),0.99,0.8];
	_fuelProgress ctrlCommit 0;
};

private _updateSpeed = {
	_vehicle = objectParent player;
	if (isNull _vehicle) exitWith {};
	private _linesTotal = (ctrlPosition _speedText select 2) / (getNumber (configFile >> "RscStructuredText" >> "size"));
	_speed = round(speed _vehicle);
	_speedText ctrlSetStructuredText parseText (format [
		"<t size='1.5' shadow='1' valign='bottom' font='FordAntenna'><t align='left'>%1</t><t align='right'>KM/H</t></t>",
		_speed
	]);
	_speedText ctrlCommit 0;
};

private _wRPM = (ctrlPosition _speedTextBackground) select 2;
private _updateRPM = {
	_vehicle = objectParent player;
	if (isNull _vehicle) exitWith {};

	_rpm = (_vehicle getSoundController "rpm") / 10000;
	_speedTextBackground ctrlSetPositionW ((_rpm * _wRPM) min _wRPM);
	_speedTextBackground ctrlSetBackgroundColor [0,0.92,0.99,0.8];
	_speedTextBackground ctrlCommit 0;
};
private _updateVehicleDistance = {
	_vehicle = objectParent player;
	if (isNull _vehicle) exitWith {};
	_vehicleName ctrlSetStructuredText parseText (format ["<t shadow='1' size='.8' align='left' font='FordAntenna'>%1</t>", getText(configOf _vehicle >> "displayName")]);
	_vehicleDistance ctrlSetStructuredText parseText (format ["<t shadow='1' size='.8' align='right' font='FordAntenna'>%1 KM</t>", RRPClient_vehicle_AllDistance toFixed 1 ]);
};


private _updateTime = {
	_statCtrl ctrlSetStructuredText parseText format ["<t shadow='1' size='.9' font='RobotoRegular'><t align='left'>ID: %1</t><t align='right'>%5:%6 %4-%3-%2</t></t>",call RRPClientPlayerID, 
	(RRPPublicTime select 0) call RRPClient_tablet_util_doubleDigits,
	(RRPPublicTime select 1) call RRPClient_tablet_util_doubleDigits,
	(RRPPublicTime select 2) call RRPClient_tablet_util_doubleDigits,
	(RRPPublicTime select 3) call RRPClient_tablet_util_doubleDigits,
	(RRPPublicTime select 4) call RRPClient_tablet_util_doubleDigits
	];
};
/* HOTKEYS */
private _makeTextControl = {
	params ["_idc","_parent","_pos","_text","_size","_type"];
	_ctrl = _display ctrlCreate [_type, _idc, _parent];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetText _text;
	_ctrl ctrlSetTextColor [1,1,1,1];
	_ctrl ctrlSetFontHeight (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)*_size;
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
	_ctrl;
};
private _makeBackgroundControl = {
	params ["_pos","_color","_parent","_idc"];
	_ctrl = _display ctrlCreate ["RscBackground", _idc, _parent];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetBackgroundColor _color;
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
	_ctrl;
};
private _makePictureControl = {
	params ["_pos","_pic","_parent","_idc"];
	_ctrl = _display ctrlCreate ["RscPicture", _idc, _parent];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetText _pic;
	_ctrl ctrlCommit 0;
	_ctrl;
};
private _getNextIDC = {
	params ["_key"];
	private _idc = ((_display getVariable "map") pushBack _key) + 10000;
	_idc;
};

private _mfmIDCmap = ["null"];
_display setVariable ["map",_mfmIDCmap];

hotkeys_controls = [];
for "_i" from 0 to 8 do {
	_space = 0.01;
	_button_border = 0.002;

	_width = 0.026 * safezoneW;
	_height = 0.044 * safezoneH;
	_baseX = 0.34;
	if (_i < 3) then {
		_width = 0.05 * safezoneW;
	} else {
		_baseX = 0.4125;
	};
	_posX = (_baseX * safezoneW + safezoneX) + ((_space * _i) + (_width * _i));
	_posY = 0.918 * safezoneH + safezoneY;

	hotkeys_controls pushBack [_posX, _posY, _height, _width];
	_button_text = format ["%1",(_i + 1)];

	_grp = _display ctrlCreate ["RscControlsGroupNoScrollbars", ((format ["main_area_button_group_%1",_i]) call _getNextIDC)];
	_grp setVariable ["main_button_name",_i];
	_grp ctrlSetPosition [_posX,_posY,_width, _height];
	_grp ctrlCommit 0;

	_alpha = 0.5;
	_color = [0,0,0,_alpha];
	_type_name = "";
	_item = "";
	_picture = "";

	_type_name = (bind_number_array select _i) select 0;
	_item = (bind_number_array select _i) select 1;
	if ((currentWeapon player) isEqualTo _item AND _item != "") then {_color = [0.165,0.42,0.18,_alpha]};

	switch (_type_name) do {
		case "weapons": {
			switch (_item) do { 
				if (_item isEqualTo (currentWeapon player) AND (currentWeapon player) != "") then {_color = [0.165,0.42,0.18,_alpha]};
				default {
					_itemInfo = [_item] call RRPClient_util_itemDetails;
					_picture = format ["%1",_itemInfo select 2];
					_desc = _itemInfo select 3;
				}; 
			};
		};
		case "inventory": {
			_itemInfo = [_item] call RRPClient_util_itemDetails;
			_picture = format ["%1",_itemInfo select 2];
		};
		case "gesture": {
			_picture = getText(missionConfigFile >> "LifeCfgSettings" >> "MFMpictureGesture");
		};
		case "dance": {
			_picture = getText(missionConfigFile >> "LifeCfgSettings" >> "MFMpictureDance");
		};
		case "pose": {
			_picture = getText(missionConfigFile >> "LifeCfgSettings" >> "MFMpicturePose");
		};
		default {
			/* code */
		};
	};

	[[0,0,1,1],_color,_grp,((format ["main_button_bg_%1",_i]) call _getNextIDC)] call _makeBackgroundControl;
	diag_log _picture;
	_ctrlPicture = [[0,0,_width,_height],"",_grp,((format ["main_button_pic_%1",_i]) call _getNextIDC)] call _makePictureControl;
	_ctrlPicture ctrlSetText _picture;

	[((format ["main_button_button_text_%1",_i]) call _getNextIDC),_grp,[_button_border,_height - (_height / 2),_width - (_button_border * 2),(_height / 2) - (_button_border * 2)],_button_text,1,"RscText"] call _makeTextControl;
};
[life_showWeaponHud] call RRPClient_hotkeys_hudWeaponHide;
/* HOTKEYS END */

private _stampHunger = -1;
private _stampDrink =  -1;
private _stampDmgPlr = -1;
private _stampRadio = -1;
private _stampSpeak = true;
private _stampXP = -1;
private _stampLevel = -1;

private _stampStamina = -1;
private _stampOxygen = RRPOxygenRemaining;
private _dateStamp = [];

while {!(isNull _display) AND !debug} do {
	if (_stampRadio isNotEqualTo TF_speak_volume_meters) then {
		_stampRadio = TF_speak_volume_meters;
		call _updateRadio;
	};

	if (!(underwater player) AND {!(_stampStamina isEqualto (getFatigue player))}) then {
		_stampStamina = getFatigue player;
		call _updateStamina;
	};

	if (_stampHunger isNotEqualto RRPClientHunger) then {
		_stampHunger = RRPClientHunger;
		call _updateFood;
	};

	if (_stampDrink isNotEqualto RRPClientThirst) then {
		_stampDrink = RRPClientThirst;
		call _updateDrink;
	};

	if (_stampDmgPlr isNotEqualto damage player) then {
		_stampDmgPlr = damage player;
		call _updateHealth;
	};
	if (_stampSpeak isNotEqualto (player getVariable ["tf_isSpeaking",false])) then {
		_stampSpeak = player getVariable ["tf_isSpeaking",false];
		call _updateSpeakerColor;
	};
	if (_dateStamp isNotEqualTo RRPPublicTime) then {
		_dateStamp = RRPPublicTime;
		call _updateTime;
	};
	if (_stampXP isNotEqualTo VRP_XP || _stampLevel isNotEqualTo VRP_Level) then {
		_stampXP = VRP_XP;
		_stampLevel = VRP_Level;
		call _updateXP;
	};
	call _updateDailies;

	if (isNull (objectParent player)) then {
		if (ctrlShown _vehicleGroup) then {
			_vehicleGroup ctrlShow false;
		};
		continue
	};
	if !(ctrlShown _vehicleGroup) then {
			_vehicleGroup ctrlShow true;
		};
	call _updateVehicle;
	call _updateSpeed;
	call _updateRPM;
	call _updateVehicleDistance;
	uiSleep 0.05;
};
