if (!params [["_unit", objNull], ["_itemClass", ""]]) exitWith {false};
if (_itemClass == "") exitWith {true};
if (!isDedicated && isNull _unit) exitWith {false};
if (isNull _unit) then {_unit = player;};

(_itemClass in (vestItems _unit + uniformItems _unit + backpackItems _unit + assignedItems _unit))