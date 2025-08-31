/*

	Filename: 	RRPClient_system_openLK.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if(isNull (findDisplay 4600)) then {
	if !(createDialog "UnionDialogLK") exitWith {};
};

ctrlSetText [4601, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

(CONTROL(4600,4602)) ctrlSetStructuredText parseText format["<t size='2' align='center' color='#d5ab04'>Внимание!<br/></t>

<img size='38' image='rimas_pad\pad_skins\codecs.paa'/>"];