

params ["_control","_index",["_mode","face"]];

private _display = uiNamespace getVariable ["RRPDialogCharCreate",displayNull];
private _npc = _display getVariable ["npc",objNull];
if (isNull _npc) exitWith {};

switch (_mode) do 
{
	case "age": {
		_age = _control lbValue _index;
		_display setVariable ["age",_age];
	};
	case "spec": {
		_spec = _control lbData _index;
		_display setVariable ["spec",_spec];
	};
	case "face": 
	{
		_face = _control lbData _index;
		_npc setFace _face;
		_display setVariable ["face",_face];
	};
	case "accessories": {
		_accessories = _control lbData _index;
		removeGoggles _npc;
		_npc addGoggles _accessories;
		_display setVariable ["accessories",_accessories];

	};
	default { };
};
