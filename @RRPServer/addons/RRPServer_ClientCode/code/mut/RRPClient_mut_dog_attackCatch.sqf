
private _isStart = param [0, true, [true]];
if (_isStart) then {
	rightKeyPressed = false;
	CanPressKey = true;
	_rndKeyToPress = selectRandom [[17,"W"],[30,"A"],[31,"S"],[32,"D"]];
	globalKeyToPress = _rndKeyToPress select 0;
	globalKeyNazw = _rndKeyToPress select 1;
	
	["<t color='#ffffff' size = '.8' font='RobotoCondensedBold'>Нажми </t><t color='#ffffff' size = '.8' font='RobotoCondensedBold'> "+ globalKeyNazw + "</t><t color='#ffffff' size = '.8' font='RobotoCondensedBold'>!</t>",0,0.8,2,0.01,0,123123] spawn BIS_fnc_dynamicText;
	dogCatchEh = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		params ["_displayorcontrol", "_key"];
		if (CanPressKey) then {
			CanPressKey = false;
			if ((_key == globalKeyToPress)) then {
				["<t color='#ffffff' size = '.8' font='RobotoCondensedBold'>Нажми </t><t color='#33adff' size = '.8' font='RobotoCondensedBold'> "+ globalKeyNazw + "</t><t color='#ffffff' size = '.8' font='RobotoCondensedBold'>!</t>",0,0.8,2,0.01,0,123123] spawn BIS_fnc_dynamicText;
				rightKeyPressed = true;
			}else{
				["<t color='#ffffff' size = '.8' font='RobotoCondensedBold'>Нажми </t><t color='#c40003' size = '.8' font='RobotoCondensedBold'> "+ globalKeyNazw + "</t><t color='#ffffff' size = '.8' font='RobotoCondensedBold'>!</t>",0,0.8,2,0.01,0,123123] spawn BIS_fnc_dynamicText;
			};
		};
		player setVariable ["dog_catch", rightKeyPressed, true];
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", dogCatchEh];
	}];
} else {
	["<t color='#ffffff' size = '.8' font='RobotoCondensedBold'>Нажми </t><t color='#c40003' size = '.8' font='RobotoCondensedBold'> "+ globalKeyNazw + "</t><t color='#ffffff' size = '.8' font='RobotoCondensedBold'>!</t>",0,0.8,2,0.01,0,123123] spawn BIS_fnc_dynamicText;
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", dogCatchEh];
};