params [
	"_uid",
	"_name",
	"_surname",
	"_id",
	["_passportTexture","\rimas_agent\assets\passports\passport_Civil.paa"]
];

if (_uid isNotEqualTo getPlayerUID player) then 
{
	_indexInIds = [_uid,life_ids] call RRPClient_system_index;
	if (_indexInIds isEqualTo -1) then {
		life_ids pushBack [_uid,time,2];
	} else {
		(life_ids select _indexInIds) params ["","","_type"];
		if (_type isEqualTo 1) then {
			life_ids set [_indexInIds,[_uid,time,3]];
		}else{
			life_ids set [_indexInIds,[_uid,time,2]];
		};
	};
};

disableSerialization;
"RRPTitlesIdCard" cutRsc ["RRPTitlesIdCard","PLAIN"];
private _display = uiNamespace getVariable "RRPTitlesIdCard";
private _group = _display displayCtrl 25001;
private _nameSurname = _group controlsGroupCtrl 25002;
private _dobText = _group controlsGroupCtrl 25003;
private _idCode = _group controlsGroupCtrl 25004;
private _darText = _group controlsGroupCtrl 25005;
private _nameText = _group controlsGroupCtrl 25006;
private _surnameText = _group controlsGroupCtrl 25007;
private _idText = _group controlsGroupCtrl 25008;
private _passport = _group controlsGroupCtrl 25009;
_passport ctrlSetText _passportTexture;
_formatPassText = "<t valign='top' font='RobotoCondensedBold' size='1'>%1 %2</t>";
_nameSurname ctrlSetStructuredText parseText (format[_formatPassText,_name,_surname]);
_idCode ctrlSetStructuredText parseText (format [_formatPassText,_id]);

_formatPassCode = "<t valign='top' font='RobotoCondensedBold' size='1'>%1</t>";
_nameText ctrlSetStructuredText parseText (format[_formatPassCode,_name]);
_surnameText ctrlSetStructuredText parseText (format[_formatPassCode,_surname]);
_idText ctrlSetStructuredText parseText (format[_formatPassCode,_id]);

true
