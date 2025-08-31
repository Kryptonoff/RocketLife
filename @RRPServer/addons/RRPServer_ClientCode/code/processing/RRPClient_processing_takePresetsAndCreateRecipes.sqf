/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
disableSerialization;
private	["_lbData","_mod","_absentAmount", "_item","_TypeItem","_itemName","_searchItem","_subArr","_absentItem","_itemSTR","_lbCtrlItems","_lbCtrlVeh","_indexLB","_netID","_vehicle","_AllreadyRecipes","_VehTrunk","_allVitems","_allRecipes","_itemName","_index","_recipe","_readyRecipe","_utilArr","_unsuccses","_scanIndexItem","_requiredItem","_amountItem","_tempArr","_allAmount","_amount","_amountFinalItem","_difItems","_coef","_divider","_difExcessItem","_succsess","_emtySTR","_itemSTR","_absentItems","_FindIfItem",
"_display","_presetArr","_itemImage","_conditions","_prof","_needLvl","_conditionMessege","_condition"];
_display   = uiNamespace getVariable ["ProcessingDialog",displayNull];

if (isNull _display) exitWith {};

_lbCtrlItems = _display displayCtrl 1992;
_lbCtrlVeh 	 = param [0,controlNull,[controlNull]];
_indexLB 	 = param [1,0,[0]];

_lbdata  = parseSimpleArray (_lbCtrlVeh lbData _indexLB);
_netID   = _lbdata select 0;
_mod 	   = _lbdata select 1;
_vehicle = objectFromNetId _netID;

if (_mod isEqualTo "vehicle") then {
	_VehTrunk    = _vehicle getVariable ["Trunk",[[],0]];
	_allVitems   = _VehTrunk select 0;
} else {
	_VehTrunk = [];
	_allVitems = player getVariable ["plrTrunk",[]];
};

_allRecipes  = getArray(missionConfigFile >> "CFGProcessing" >> processing >> "Recipes");
_unsuccses   = "\RRP_icons\forUI\processing_unsuccess.paa";
_succsess    = "\RRP_icons\forUI\processing_success.paa";

_AllreadyRecipes = [];
lbClear _lbCtrlItems;
{
	_item        = ((_x select 0) select 0);
	_TypeItem    = ((_x select 0) select 1);
	_itemName    = (getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName"));
  _itemImage   = getText(missionConfigFile >> "VirtualItems" >> _item >> "icon");
	_index 		   = lbSize _lbCtrlItems;
  _condition   = (_x select 1);
	_recipe		 	 = (_x select 3);
	_prof 			 = ((_x select 4) select 0);
	_needLvl		 = ((_x select 4) select 1);
	_readyRecipe = [[]];
	_conditions = true;

	if !(_condition isEqualTo "") then {
		if !((call (compile _condition))) then {_conditions = false; _conditionMessege = (_x select 2)};
	};

	(_x # 4) params ["_needProf","_needLvlProf"];
	if !(_needProf isEqualTo "") then {
		(_needProf call RRPCLient_util_getSkillInfo) params ["_maxLvl","_curLvl"];
		if (_curLvl < _needLvlProf) then {
			_conditions = false; _conditionMessege = format ["Необходим навык %1 с уровнем %2",(getText(missionConfigFile >> "CfgSkills" >> _prof >> "displayName")),_needLvl];
		};
	};

	if !(_conditions) then {
			_lbCtrlItems lbAdd format ["%1",_itemName];
			_lbCtrlItems lbSetData [_index,_conditionMessege];
			_lbCtrlItems lbSetTextRight [_index,"Не готов"];
			_lbCtrlItems lbSetPictureRight [_index,_unsuccses];
			_lbCtrlItems lbSetPicture [_index,_itemImage];
	} else {
		_utilArr = [[],[]];
		{
			_FindIfItem = _x select 0;
			_subArr     = [];
			{
			   _subArr pushBack (_x select 0);
			} forEach _allVitems;

      		_scanIndexItem = _subArr find _FindIfItem;

			if (_scanIndexItem isEqualto -1) then
			{
				(_utilArr select 1) pushBack (_x select 0);
			} else {
				if((((_allVitems select _scanIndexItem) select 1) / (_x select 1)) < 1) then
				{
					(_utilArr select 1) pushBack (_x select 0);
				} else {
					_requiredItem = ((_allVitems select _scanIndexItem) select 0);
					_amountItem	  = floor(round((_allVitems select _scanIndexItem) select 1) /  (_x select 1));
					_tempArr 		  = [];
					_tempArr pushBack _requiredItem;
					_tempArr pushBack _amountItem;
					(_utilArr select 0) pushBack _tempArr;
				};
			};
		} forEach _recipe;

		if ((_utilArr select 1) isEqualto []) then {
			_allAmount = [];
			{
				_amount 	 = _x select 1;
				_allAmount pushBack _amount;
			} forEach (_utilArr select 0);
			_allAmount sort true;
			_amountFinalItem = _allAmount select 0;
			{
				_searchItem = _x select 0;
				_difItems 	= _amountFinalItem;
				_subArr     = [];
				{
					_subArr pushBack (_x select 0);
				} forEach _recipe;
        		_Coef 		  	 = _subArr find _searchItem;
				_divider  		 = (_recipe select _Coef) select 1;
				_difExcessItem = round(_difItems * _divider);
				(_readyRecipe select 0) pushBack [_x select 0, _difExcessItem];
			} forEach (_utilArr select 0);

			_readyRecipe pushBack [_item,_TypeItem];
			_readyRecipe pushBack _index;
			_readyRecipe pushBack _amountFinalItem;
			_readyRecipe pushBack _prof;
			_AllreadyRecipes  pushBack _readyRecipe;

      _lbCtrlItems lbAdd _itemName;
		  _lbCtrlItems lbSetData [_index, format ["Компонентов достаточно для производства %1x",_amountFinalItem]];
      _lbCtrlItems lbSetTextRight [_index, "Готов"];
     	_lbCtrlItems lbSetPicture [_index,_itemImage];
     	_lbCtrlItems lbSetPictureRight [_index,_succsess];
		} else {
			_absentItems = "";
			{
				_absentItem  = (getText(missionConfigFile >> "VirtualItems" >> _x select 0  >> "displayName"));
				_absentAmount = format [" %1x",_x select 1];
				_emtySTR   	 = if (_forEachIndex isEqualto 0) then {" "} else {", "};
				_itemSTR 	 = _emtySTR + _absentItem + _absentAmount;
				_absentItems = _absentItems + _itemSTR;
			} forEach _recipe;

		_lbCtrlItems lbAdd _itemName;
		_lbCtrlItems lbSetData [_index, format ["Для производства 1-го %2 нужно: %1",_absentItems,_itemName]];
		_lbCtrlItems lbSetTextRight [_index, "Не готов"];
		_lbCtrlItems lbSetPicture [_index,_itemImage];
		_lbCtrlItems lbSetPictureRight [_index,_unsuccses];
		};
	};

} foreach _allRecipes;

_presetArr = [];
_presetArr pushBack _AllreadyRecipes;
_presetArr pushBack _vehicle;
_presetArr pushBack _VehTrunk;
missionNamespace setVariable ["readyRecipes",_presetArr];

_lbCtrlItems lbSetCurSel -1;
