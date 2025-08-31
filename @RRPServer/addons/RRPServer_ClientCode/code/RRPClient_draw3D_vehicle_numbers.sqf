/*

	Project: 	Smart Role Play
	Author:		Arrra and Fairy Tale
	https://vk.com/arrrovich
	https://vk.com/juba_johnson

*/

{
	_className = typeOf _x;
	if (!(_x getVariable ["notCheat",false]) or !(_className in ["rrp_table","rrp_table21","rrp_bench","rrp_bench2","rrp_bench3","rrp_bench4"])) then
	{
		_distance = cameraOn distance _x;
		_alpha = (1-(_distance/10));
		_clr = [1,1,1,_alpha];

		_owners = (_x getVariable ["vehicle_info_owners",[]]);
		_number = (_x getVariable ["dbInfo",[]]);
		_name = if (_owners isEqualto []) then {/*'Техника неизвестного происхождения! Срочно сообщите администратору на форум rimasrp.life!'*/""} else {
		if (count _number > 0) then {format ["%1",_number select 1];} else {"Арендованый"};
		};
		_pos = _x modelToWorldVisual (_x selectionPosition "head");
		_pos set [2, (_pos select 2) + 1];

		if (_className isEqualto "I_UGV_02_Demining_F") then {_name = _x getVariable ["idUAV",-1]};
		drawIcon3D['',_clr,_pos,0,0,0,_name,2,0.04];
	};

} forEach ((cameraOn nearEntities[['LandVehicle', 'Ship', 'Air'], 10]) - [cameraOn, vehicle cameraOn]);
