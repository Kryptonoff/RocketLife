/*
  Project: Rimas Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

#include "..\script_macros.hpp"
private _side = param [0,"",[""]];
private _ret = [14026.5,18684.4,0.00151634];

switch (worldName) do {
	case "RRpMap": {
		switch (player call getSide) do
			{
				case "civ" : {_ret = getMarkerPos "Stolica_1"};
				case "reb" : {_ret = getMarkerPos "base_reb_1"};
				case "cop" : {_ret = getMarkerPos "cop_spawn_1"};
				case "med" : {_ret = getMarkerPos "base_hospital_1"};
				default {};
			};

	};
	default {};
};

_ret