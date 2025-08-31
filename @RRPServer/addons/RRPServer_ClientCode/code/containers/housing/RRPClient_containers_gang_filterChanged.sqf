/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

disableSerialization;
private _index = param[1, -1, [0]];
if (_index isEqualTo - 1) exitWith {
    "Bad Data Filter" call chat;
    closeDialog 0;
};

uiNamespace setVariable["GangBox_Filter", _index];

private _gangBoxGear = ((findDisplay 4800) displayCtrl 4802);
private _playerGear = ((findDisplay 4800) displayCtrl 4803);
private _gangBoxWeight = ((findDisplay 4800) displayCtrl 4804);

lbClear _gangBoxGear;
lbClear _playerGear;

private _gangBoxSlots = life_gang_box getVariable["slots", 0];
private _gangBoxInventory = life_gang_box getVariable["inventory", [[],0]];

private _playerItems = call RRPClient_util_getplayeritems;

private _containerItems = _gangBoxInventory select 0;
private _currentWeight = _gangBoxInventory select 1;
private _maxWeight = (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_trunkInventoryWeight")) * _gangBoxSlots;

_gangBoxWeight ctrlSetText format[("Вес: %1/%2", _currentWeight, _maxWeight];

private["_itemInfo", "_good"]; 
{
    _itemInfo = [_x select 0] call RRPClient_util_itemDetails;
    if (_itemInfo isEqualTo[]) exitWith {};
    _good = false;

    switch (_index) do 
	{
        case 0:
		{
            _good = true
        };
        case 1:
		{
			_good = if ((_itemInfo select 4) isEqualTo "Equipment") then {
				true
			} else {
				false
			};
		};
        case 2:
		{
			_good = if ((_itemInfo select 4) isEqualTo "Weapon") then {
				true
			} else {
				false
			};
		};
        case 3:
		{
			_good = if ((_itemInfo select 4) isEqualTo "Magazine" && !((_itemInfo select 5) isEqualTo "UnknownMagazine")) then {
				true
			} else {
				false
			};
		};
        case 4:
		{
			_good = if ((_itemInfo select 4) isEqualTo "Item" && ((_itemInfo select 5) in ["AccessoryMuzzle", "AccessoryPointer", "AccessorySights", "AccessoryBipod"])) then {
				true
			} else {
				false
			};
		};
        case 5:
		{
			_good = if ((_itemInfo select 4) isEqualTo "Item" && !((_itemInfo select 5) in ["AccessoryMuzzle", "AccessoryPointer", "AccessorySights", "AccessoryBipod"])) then {
				true
			} else {
				false
			};
		};
    };

    if (_good) then 
	{
        if (_x select 1 > 1) then 
		{
            _playerGear lbAdd format["[%2] %1", _itemInfo select 1, _x select 1];
        } else {
            _playerGear lbAdd format["%1", _itemInfo select 1];
        };
        _playerGear lbSetData[(lbSize _playerGear) - 1, _itemInfo select 0];
        _playerGear lbSetPicture[(lbSize _playerGear) - 1, _itemInfo select 2];
    };
}
foreach _playerItems;

{
    _good = false;
    _itemInfo = [_x select 0] call RRPClient_util_itemDetails;
    if !(_itemInfo isEqualTo[]) then 
	{
        switch (_index) do 
		{
            case 0:
			{
				_good = true
			};
            case 1:
			{
				_good = if ((_itemInfo select 4) isEqualTo "Equipment") then {
					true
				} else {
					false
				};
			};
            case 2:
			{
				_good = if ((_itemInfo select 4) isEqualTo "Weapon") then {
					true
				} else {
					false
				};
			};
            case 3:
			{
				_good = if ((_itemInfo select 4) isEqualTo "Magazine" && !((_itemInfo select 5) isEqualTo "UnknownMagazine")) then {
					true
				} else {
					false
				};
			};
            case 4:
			{
				_good = if ((_itemInfo select 4) isEqualTo "Item" && ((_itemInfo select 5) in ["AccessoryMuzzle", "AccessoryPointer", "AccessorySights", "AccessoryBipod"])) then {
					true
				} else {
					false
				};
			};
            case 5:
			{
				_good = if ((_itemInfo select 4) isEqualTo "Item" && !((_itemInfo select 5) in ["AccessoryMuzzle", "AccessoryPointer", "AccessorySights", "AccessoryBipod"])) then {
					true
				} else {
					false
				};
			};
        };
    };

    if (_good) then {
        if (_x select 1 > 1) then {
            _gangBoxGear lbAdd format["[%2] %1", _itemInfo select 1, _x select 1];
        } else {
            _gangBoxGear lbAdd format["%1", _itemInfo select 1];
        };
        _gangBoxGear lbSetData[(lbSize _gangBoxGear) - 1, _itemInfo select 0];
        _gangBoxGear lbSetPicture[(lbSize _gangBoxGear) - 1, _itemInfo select 2];
    };
}
foreach _containerItems;

lbSort[_playerGear, "ASC"];
lbSort[_gangBoxGear, "ASC"];

_playerGear lbSetCurSel 0;
_gangBoxGear lbSetCurSel 0;