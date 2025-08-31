/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND

	Note: 
		Function can be throwed
		input number of owner
*/

_owner = _this;
if (_owner in [0,-2,2]) throw "Owner не определен, попробуйте еще раз";
(allPlayers select {owner _x isEqualTo _owner}) select 0;