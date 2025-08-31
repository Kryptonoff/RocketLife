#include "..\..\macros.hpp"
disableSerialization;
params [
	["_docList", controlNull, [controlNull]],
	["_select",-1,[0]]
];

if (isNull _docList OR _select isEqualTo -1) exitWith {}; //Bad data

private _docName = CONTROL(7700,2653);
private _docDescription = CONTROL(7700,2654);
private _docTimeDay = CONTROL(7700,2655);
private _giveButton = CONTROL(7700,2656);

private _docClass = _docList lbData _select;

if (!(isClass (missionConfigFile >> "LifeCfgDocuments" >> _docClass)) && _docClass isEqualTo "") then {
	_docName ctrlEnable false;
	_docName ctrlSetText "";
	_docDescription ctrlEnable false;
	_docDescription ctrlSetText "";
	_docTimeDay ctrlEnable false;
	_docTimeDay ctrlSetText "";
	_giveButton ctrlEnable false;
} else {
    private _name = M_CONFIG(getText,"LifeCfgDocuments",_docClass,"name");
	private _description = M_CONFIG(getText,"LifeCfgDocuments",_docClass,"description");
	private _expires = M_CONFIG(getNumber,"LifeCfgDocuments",_docClass,"expires");
    private _edit = (M_CONFIG(getNumber,"LifeCfgDocuments",_docClass,"edit") == 1);

	_docName ctrlEnable _edit;
	_docName ctrlSetText _name;

	_docDescription ctrlEnable _edit;
	_docDescription ctrlSetText _description;

	_docTimeDay ctrlEnable _edit;
	_docTimeDay ctrlSetText str(_expires);

	_giveButton ctrlEnable true;
};
