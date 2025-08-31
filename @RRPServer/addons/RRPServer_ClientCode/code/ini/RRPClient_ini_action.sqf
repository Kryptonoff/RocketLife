/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2013-2016 Nicolas BOITEUX

	CLASS OO_INIDBI
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
*/

try 
{  
	if (isNil "_this") then 
	{
		_this = []
	} else {
		if !(_this isEqualType []) then 
		{	
			_this = [_this]
		}
	};  
	if ((count _this) > 0) then 
	{   
		private _class = "OO_INIDBI";   
		private _parentClass =  "No Parent";   
		if (isNil {_this select 0}) then {_this set [0,_class]};   
		switch (_this select 0) do 
		{   
			case "new": 
			{    
				missionNamespace setVariable [("OO_INIDBI" + "_IDAI"), ((missionNamespace getVariable [("OO_INIDBI" + "_IDAI"),0]) + 1)];    
				private _code = compile format ['
					if (isNil "_this") then 
					{
						_this = []
					} else {
						if !(_this isEqualType []) then 
						{
							_this = [_this]
						}
					}; 
					if ((count _this) <= 1) then 
					{
						_this set [1,nil]
					}; 
					(["%1", (_this select 0), (_this select 1), 0]) call (missionNamespace getVariable ["OO_INIDBI", {nil}]);', 
					("OO_INIDBI" + "_" + str((missionNamespace getVariable [("OO_INIDBI" + "_IDAI"),0])))];    
				if ((count _this) <= 1) then 
				{	
					_this set [1,nil]
				};    
				private _classID = "OO_INIDBI" + "_" + str((missionNamespace getVariable [("OO_INIDBI" + "_IDAI"),0]));    
				missionNamespace setVariable [format ['%1_this', _classID], _code];    
				["constructor", (_this select 1)] call _code;    
				_code;   
			};   
			case "static":
			{    
				private _code = compile format 
				[
					'
						if (isNil "_this") then {_this = []
						} else {
							if !(_this isEqualType []) then 
							{
								_this = [_this]
							}
						}; 
						if ((count _this) <= 1) then 
						{
							_this set [1,nil]
						}; 
						(["%1", (_this select 0), (_this select 1), 0]) call (missionNamespace getVariable ["OO_INIDBI", {nil}]);', 
					"OO_INIDBI"
				];    
				[(_this select 1) select 0, (_this select 1) select 1] call _code;   
			};   
			case "protected":
			{    
				private _array = toArray str (missionNamespace getVariable "OO_INIDBI");        
				_array deleteAt (count _array - 1);        
				_array deleteAt (0);        
				missionNamespace setVariable ["OO_INIDBI", (compileFinal toString _array)];   
			};   
			case "delete": 
			{    
				if ((count _this) == 2) then 
				{
					_this set [2,nil]
				};    
				["deconstructor", (_this select 2)] call (_this select 1);   
			};   
			default 
			{  
				private _classID = _this select 0;    
				private _member = _this select 1;    
				private _access = (if ((count _this) > 3) then {_this select 3} else {0});    
				private _oopOriginCall = (if ((count _this) > 4) then {_this select 4} else {nil});    
				_this = (if ((count _this) > 2) then {_this select 2} else {nil});    
				private _argType = if (isNil "_this") then {""} else {typeName _this};    
				switch (true) do 
				{     
					default { throw [34, _class, _member, _argType]; };
				case ((_access >= 2) && {(_member == "dbname")} && {((_argType isEqualTo toUpper("string")) || {toUpper("string") isEqualTo "ANY"}) || (_argType isEqualTo "")}): 
				{
					if (isNil "_this") then {missionNamespace getVariable [(_classID + "_" + "dbname"), nil]} else {missionNamespace setVariable [(_classID + "_" + "dbname"), _this]};
				};
				case ((_access >= 2) && {(_member == "version")} && {((_argType isEqualTo toUpper("string")) || {toUpper("string") isEqualTo "ANY"}) || (_argType isEqualTo "")}): 
				{
					if (isNil "_this") then {missionNamespace getVariable [(_classID + "_" + "version"), nil]
						} else {
					missionNamespace setVariable [(_classID + "_" + "version"), _this]};
				};
				case ((_access >= 2) && {(_member ==  "separator")} && {((_argType isEqualTo toUpper("string")) || {toUpper("string") isEqualTo "ANY"}) || (_argType isEqualTo "")}): {if (isNil "_this") then {missionNamespace getVariable [(_classID + "_" +  "separator"), nil]} else {missionNamespace setVariable [(_classID + "_" +  "separator"), _this]};};

				case ((_access >= 0) && {(_member == "constructor")} && {((_argType isEqualTo toUpper("string")) || {toUpper("string") isEqualTo "ANY"})}): 
				{
					(if(isNil "_oopOriginCall")then
					{
						[_classID, "version", (if (isNil { "2.05"}) then {nil} else { "2.05"}),2] call (missionNamespace getVariable [_class, {nil}]) 
					}else{ 
						[_classID, "version", (if (isNil { "2.05"}) then {nil} else { "2.05"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])
					});
					(if(isNil "_oopOriginCall")then
					{ 	
						[_classID, "setDbName", (if (isNil { _this}) then {nil} else { _this}),2] call (missionNamespace getVariable [_class, {nil}]) 
					}else{ 
						[_classID, "setDbName", (if (isNil { _this}) then {nil} else { _this}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])
					});
					(if(isNil "_oopOriginCall")then
					{ 
						[_classID, "getSeparator", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) 
					}else{ 
						[_classID, "getSeparator", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])
					});
				};

				case ((_access >= 0) && {(_member ==  "setDbName")} && {((_argType isEqualTo toUpper("string")) || {toUpper("string") isEqualTo "ANY"})}): 
				{
					private ["_dbname"];
					_dbname = _this;
					if(_dbname == "") then 
					{
						_dbname = "default";
					};
					(if(isNil "_oopOriginCall")then
					{ 
						[_classID, "dbname", (if (isNil { _dbname}) then {nil} else { _dbname}),2] call (missionNamespace getVariable [_class, {nil}]) 
					}else{ 
						[_classID, "dbname", (if (isNil { _dbname}) then {nil} else { _dbname}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])
					});
				};

				case ((_access >= 0) && {(_member ==  "setSeparator")} && {((_argType isEqualTo toUpper("string")) || {toUpper("string") isEqualTo "ANY"})}): 
				{
					private ["_separator"];
					_separator = (if(isNil "_oopOriginCall")then{ [_classID, "getSeparator", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "getSeparator", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					"inidbi2" callExtension format["setseparator%1%2", _separator, _this];
					_separator = (if(isNil "_oopOriginCall")then{ [_classID, "getSeparator", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "getSeparator", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
				};

				case ((_access >= 0) && {(_member ==  "getSeparator")} && {((_argType isEqualTo toUpper("")) || {toUpper("") isEqualTo "ANY"})}): 
				{
					private ["_separator"];
					_separator = "inidbi2" callExtension "getseparator";
					(if(isNil "_oopOriginCall")then{ [_classID, "separator", (if (isNil { _separator}) then {nil} else { _separator}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "separator", (if (isNil { _separator}) then {nil} else { _separator}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					_separator;
				};

				case ((_access >= 0) && {(_member ==  "getDbName")} && {((_argType isEqualTo toUpper("")) || {toUpper("") isEqualTo "ANY"})}): 
				{
					(if(isNil "_oopOriginCall")then
					{					
						[_classID, "dbname", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) 
					}else{ 
						[_classID, "dbname", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])
					});
				};  

				case ((_access >= 2) && {(_member ==  "getFileName")} && {((_argType isEqualTo toUpper("")) || {toUpper("") isEqualTo "ANY"})}): 
				{
					private ["_filename"];
					_filename = (if(isNil "_oopOriginCall")then{ [_classID, "dbname", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "dbname", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}) + ".ini";
					_filename;
				};

				case ((_access >= 0) && {(_member ==  "encodeBase64")} && {((_argType isEqualTo toUpper("string")) || {toUpper("string") isEqualTo "ANY"})}): 
				{
					private["_data"];

					if(count (format["%1", _this]) > 2048) then 
					{
						_data = "IniDBI: encodeBase64 failed data too big > 6K";
						(if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil { _data}) then {nil} else { _data}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil { _data}) then {nil} else { _data}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					} else {
						_data = "inidbi2" callExtension format["encodebase64%1%2", (if(isNil "_oopOriginCall")then{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}), _this];
					};
					_data;
				};

				case ((_access >= 0) && {(_member ==  "decodeBase64")} && {((_argType isEqualTo toUpper("string")) || {toUpper("string") isEqualTo "ANY"})}): 
				{
					private["_data"];

					if(count (format["%1", _this]) > 4096) then 
					{
						_data = "IniDBI: decodeBase64 failed data too big > 6K";
						(if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil { _data}) then {nil} else { _data}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil { _data}) then {nil} else { _data}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					} else {
						_data = "inidbi2" callExtension format["decodebase64%1%2", (if(isNil "_oopOriginCall")then{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}), _this];
					};
					_data;
				};

				case ((_access >= 0) && {(_member ==  "getTimeStamp")} && {((_argType isEqualTo toUpper("")) || {toUpper("") isEqualTo "ANY"})}): 
				{
					private["_data"];
					_data = "inidbi2" callExtension "gettimestamp";
					_data = call compile _data;
					_data;
				};

				case ((_access >= 0) && {(_member ==  "getVersion")} && {((_argType isEqualTo toUpper("")) || {toUpper("") isEqualTo "ANY"})}): 
				{
					private["_data"];
					_data = "inidbi2" callExtension "version";
					_data = format["Inidbi: %1 Dll: %2", (if(isNil "_oopOriginCall")then{ [_classID, "version", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "version", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}), _data];
					_data;
				};

				case ((_access >= 0) && {(_member ==  "getSections")} && {((_argType isEqualTo toUpper("")) || {toUpper("") isEqualTo "ANY"})}): 
				{
					private["_file", "_data"];

					_file = (if(isNil "_oopOriginCall")then{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});

					_data = "inidbi2" callExtension format["getsections%1%2",(if(isNil "_oopOriginCall")then{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}), _file];
					_data = call compile _data;
					_data;
				};

				case ((_access >= 0) && {(_member ==  "log")} && {((_argType isEqualTo toUpper("string")) || {toUpper("string") isEqualTo "ANY"})}): 
				{
					//hints format["%1", _this];
					diag_log format["%1", _this];
				};

				case ((_access >= 0) && {(_member ==  "exists")} && {((_argType isEqualTo toUpper("")) || {toUpper("") isEqualTo "ANY"})}): 
				{
					private["_result"];
					_result = "inidbi2" callExtension format["exists%1%2", (if(isNil "_oopOriginCall")then{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}), (if(isNil "_oopOriginCall")then{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])})];
					_result = call compile _result;
					_result;
				};

				case ((_access >= 0) && {(_member ==  "delete")} && {((_argType isEqualTo toUpper("")) || {toUpper("") isEqualTo "ANY"})}): 
				{
					private["_result"];
					_result = "inidbi2" callExtension format["delete%1%2", (if(isNil "_oopOriginCall")then{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}), (if(isNil "_oopOriginCall")then{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])})];
					_result = call compile _result;
					_result;
				};

				case ((_access >= 0) && {(_member ==  "deleteKey")} && {((_argType isEqualTo toUpper("array")) || {toUpper("array") isEqualTo "ANY"})}): 
				{
					private ["_file", "_section", "_result", "_key"];
					_section  = _this select 0;
					_key  = _this select 1;
					_file = (if(isNil "_oopOriginCall")then{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					if(isnil "_file") exitWith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil {"IniDBI: deletesection failed databasename is empty"}) then {nil} else {"IniDBI: deletesection failed databasename is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil {"IniDBI: deletesection failed databasename is empty"}) then {nil} else {"IniDBI: deletesection failed databasename is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); };
					if(isnil "_section") exitWith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil {"IniDBI: deletesection failed sectionname is empty"}) then {nil} else {"IniDBI: deletesection failed sectionname is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil {"IniDBI: deletesection failed sectionname is empty"}) then {nil} else {"IniDBI: deletesection failed sectionname is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); };
					if(isnil "_key") exitWith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil {"IniDBI: deletesection failed key is empty"}) then {nil} else {"IniDBI: deletesection failed key is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil {"IniDBI: deletesection failed key is empty"}) then {nil} else {"IniDBI: deletesection failed key is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); };
					_result = "inidbi2" callExtension format["deletekey%1%2%1%3%1%4", (if(isNil "_oopOriginCall")then{ [_classID, "getSeparator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "getSeparator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}), _file, _section, _key];
					_result = call compile _result;
					_result;
				};  

				case ((_access >= 0) && {(_member ==  "deleteSection")} && {((_argType isEqualTo toUpper("string")) || {toUpper("string") isEqualTo "ANY"})}): 
				{
					private ["_file", "_section", "_result"];

					_file = (if(isNil "_oopOriginCall")then{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					_section  = _this;

					if(isnil "_file") exitWith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil {"IniDBI: deletesection failed databasename is empty"}) then {nil} else {"IniDBI: deletesection failed databasename is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil {"IniDBI: deletesection failed databasename is empty"}) then {nil} else {"IniDBI: deletesection failed databasename is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); };
					if(isnil "_section") exitWith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil {"IniDBI: deletesection failed sectionname is empty"}) then {nil} else {"IniDBI: deletesection failed sectionname is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil {"IniDBI: deletesection failed sectionname is empty"}) then {nil} else {"IniDBI: deletesection failed sectionname is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); };

					_result = "inidbi2" callExtension format["deletesection%1%2%1%3", (if(isNil "_oopOriginCall")then{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}), _file, _section];
					_result = call compile _result;
					_result;
				};

				case ((_access >= 0) && {(_member ==  "read")} && {((_argType isEqualTo toUpper("array")) || {toUpper("array") isEqualTo "ANY"})}): 
				{
					private ["_count", "_file", "_section", "_key", "_data", "_result", "_defaultvalue"];
					_count = count _this;
					if(_count < 2) exitwith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil { "Inidb: read failed not enough parameter"}) then {nil} else { "Inidb: read failed not enough parameter"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil { "Inidb: read failed not enough parameter"}) then {nil} else { "Inidb: read failed not enough parameter"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});  };
					_section  = _this select 0;
					_key   = _this select 1;
					if(_count > 2) then {_defaultvalue = _this select 2;};
					_file = (if(isNil "_oopOriginCall")then{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					if(isnil "_file") exitWith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil {"IniDBI: read failed databasename is empty"}) then {nil} else {"IniDBI: read failed databasename is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil {"IniDBI: read failed databasename is empty"}) then {nil} else {"IniDBI: read failed databasename is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); };
					if(isnil "_section") exitWith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil {"IniDBI: read failed sectionname is empty"}) then {nil} else {"IniDBI: read failed sectionname is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil {"IniDBI: read failed sectionname is empty"}) then {nil} else {"IniDBI: read failed sectionname is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); }; 
					if(isnil "_key") exitWith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil {"IniDBI: read failed keyname is empty"}) then {nil} else {"IniDBI: read failed keyname is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil {"IniDBI: read failed keyname is empty"}) then {nil} else {"IniDBI: read failed keyname is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); };
					if(isnil "_defaultvalue") then { _defaultvalue = false;};
					_result = "inidbi2" callExtension format["read%1%2%1%3%1%4",(if(isNil "_oopOriginCall")then{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}), _file, _section, _key];
					_result = call compile _result;

					if(_result select 0) then 
					{
						_data = _result select 1;
					} else {
						_data = _defaultvalue;
					};
					_data;
				};

				case ((_access >= 2) && {(_member ==  "parseArray")} && {((_argType isEqualTo toUpper("array")) || {toUpper("array") isEqualTo "ANY"})}):
				{
					private ["_data", "_exit", "_array"];

					_exit = _this select 0;
					_data = _this select 1;

					{
						if!(typename _x in ["BOOL", "ARRAY", "STRING", "SCALAR"]) then { _exit = true; };
						if(typename _x == "ARRAY") then 
						{					
							_array = [_exit, _x];
							_exit = (if(isNil "_oopOriginCall")then{ [_classID, "parseArray", (if (isNil { _array}) then {nil} else { _array}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "parseArray", (if (isNil { _array}) then {nil} else { _array}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); 
						};
						uiSleep 0.0001;
					}foreach _data;
					_exit;
				};

				case ((_access >= 0) && {(_member ==  "write")} && {((_argType isEqualTo toUpper("array")) || {toUpper("array") isEqualTo "ANY"})}): 
				{
					private["_array", "_file", "_section", "_key", "_data", "_exit", "_log"];

					if(count _this < 3) exitwith 
					{			
						(if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil { "Inidb: write failed not enough parameter"}) then {nil} else { "Inidb: write failed not enough parameter"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil { "Inidb: write failed not enough parameter"}) then {nil} else { "Inidb: write failed not enough parameter"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					};

					_section  = _this select 0;
					_key   = _this select 1;
					_data   = _this select 2; 

					_file = (if(isNil "_oopOriginCall")then{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "getFileName", (if (isNil { nil}) then {nil} else { nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					_exit   = false;

					if(isnil "_file") exitWith {  (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil { "IniDBI: write failed databasename is empty"}) then {nil} else { "IniDBI: write failed databasename is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil { "IniDBI: write failed databasename is empty"}) then {nil} else { "IniDBI: write failed databasename is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});  };
					if(isnil "_section") exitWith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil { "IniDBI: write failed sectionname is empty"}) then {nil} else { "IniDBI: write failed sectionname is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil { "IniDBI: write failed sectionname is empty"}) then {nil} else { "IniDBI: write failed sectionname is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); };
					if(isnil "_key") exitWith { (if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil { "IniDBI: write failed keyname is empty"}) then {nil} else { "IniDBI: write failed keyname is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil { "IniDBI: write failed keyname is empty"}) then {nil} else { "IniDBI: write failed keyname is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); };
					if(isnil "_data") exitWith {(if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil { "IniDBI: write failed data is empty"}) then {nil} else { "IniDBI: write failed data is empty"}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil { "IniDBI: write failed data is empty"}) then {nil} else { "IniDBI: write failed data is empty"}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); };

					if!(typename _data in ["BOOL", "ARRAY", "STRING", "SCALAR"]) then {_exit = true;};
					if(typeName _data == "STRING") then { _data = '"'+ _data + '"'};
					if(typename _data == "ARRAY") then 
					{				
						_array = [false, _data];
						_exit = (if(isNil "_oopOriginCall")then{ [_classID, "parseArray", (if (isNil { _array}) then {nil} else { _array}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "parseArray", (if (isNil { _array}) then {nil} else { _array}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}); 
					};

					if(_exit) exitWith 
					{
						_log = format["IniDBI: write failed, %1 %2 data contains object should be ARRAY, SCALAR, STRING type", _section, _key]; 
						(if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil { _log}) then {nil} else { _log}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil { _log}) then {nil} else { _log}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					};

					if(count (format["%1", _data]) > 8100) then 
					{
						_data = false;
						_log = format["IniDBI: write failed %1 %2 data too big > 8K", _section, _key];
						(if(isNil "_oopOriginCall")then{ [_classID, "log", (if (isNil { _log}) then {nil} else { _log}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "log", (if (isNil { _log}) then {nil} else { _log}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])});
					} else {
						_data = format['"%1"', _data];
						_data = "inidbi2" callExtension format["write%1%2%1%3%1%4%1%5", (if(isNil "_oopOriginCall")then{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_class, {nil}]) }else{ [_classID, "separator", (if (isNil {nil}) then {nil} else {nil}),2] call (missionNamespace getVariable [_oopOriginCall, {nil}])}), _file, _section, _key, _data];
						_data = call compile _data;
					};
					_data;
				};

				case ((_access >= 0) && {(_member == "deconstructor")} && {((_argType isEqualTo toUpper("")) || {toUpper("") isEqualTo "ANY"})}): 
				{ 
					(missionNamespace setVariable [(_classID + "_" + "version"), nil]);
					(missionNamespace setVariable [(_classID + "_" + "dbname"), nil]);
					(missionNamespace setVariable [(_classID + "_" + "separator"), nil]);
				};
			};
		};
	};
};} catch {  switch (_exception select 0) do {   case 34 : {    format ['ERROR UNDEF : %1("%3","%2")', _exception select 1, _exception select 2, _exception select 3] call BIS_fnc_error;   };  }; };