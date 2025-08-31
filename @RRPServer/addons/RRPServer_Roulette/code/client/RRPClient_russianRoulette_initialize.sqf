
RRPClientIsPlayingRussianRoulette = false;
RRPClientRussianRouletteHudVisible = false;
RRPClientRussianRouletteChair = objNull;
RRPClientRussianRouletteCountDownThread = -1;
RRPClientRussianRouletteCanEscape = false;
RRPClientRussianRouletteNextShotIsFatal = false;
RRPClientLayerRussianRoulette = ("RscExileRussianRouletteLayer" call BIS_fnc_rscLayer);
RR_3D = addMissionEventHandler ["Draw3D",{

	private _drawRadius = 15;
	private _nearTablet = (getPosATL player) nearObjects ["Land_WoodenTable_large_F",20];
	if (_nearTablet isNotEqualTo []) then 
	{
		{
			if (_x getVariable ["GameStat",[]] isNotEqualTo [])	then
			{
				(_x getVariable ["GameStat",[]]) params ["_status","_pot","_round"];
				_status = call {
					if (_status isEqualTo 0) exitWith {"Ожидаем игроков"};
					if (_status isEqualTo 2) exitWith {"Скоро буря..."};
					"Игра идет"
				};
				_distanceForPlayer = player distance2D _x;
				_scale = 1 + (( 0.7 /_drawRadius) * _distanceForPlayer);
				_pos = getPosATL _x;
				drawIcon3D ["",[1,1,1,1],[(_pos select 0),(_pos select 1),((_pos select 2) + 1)],1/_scale,1/_scale,0,_status,2,0.038/_scale,"RobotoCondensedBold","center",true];
				drawIcon3D ["",[1,1,1,1],[(_pos select 0),(_pos select 1),((_pos select 2) + 0.9)],1/_scale,1/_scale,0,format["Банк: %1",[_pot] call RRPClient_util_numberText],2,0.038/_scale,"RobotoCondensedBold","center",true];
				drawIcon3D ["",[1,1,1,1],[(_pos select 0),(_pos select 1),((_pos select 2) + 0.8)],1/_scale,1/_scale,0,format["Раунд: %1",_round],2,0.038/_scale,"RobotoCondensedBold","center",true];

			};		
		} forEach _nearTablet;
	};
	private _nearPlayers = ((cameraOn nearEntities[['Man'], _drawRadius]) - [cameraOn, vehicle cameraOn]);
	if (_nearPlayers isNotEqualTo []) then 
	{
		{
			if (_x getVariable ["CurrentPlayer",false]) then 
			{	
				_distanceForPlayer = player distance2D _x;
				_pos = _x modelToWorldVisual (_x selectionPosition "head");
				_scale = 1 + (( 0.7 /_drawRadius) * _distanceForPlayer);
        		drawIcon3D [
					"\rimas_agent\assets\waypoints\01.paa",
				  	[1,1,1,1],
					[(_pos select 0),(_pos select 1),((_pos select 2) + 0.6)],
					1/_scale,
					1/_scale,
					0,
					"",
					2,
					0.038/_scale,
					"RobotoCondensedBold",
					"center",true
				];
			};
		} forEach _nearPlayers;
	};
}];