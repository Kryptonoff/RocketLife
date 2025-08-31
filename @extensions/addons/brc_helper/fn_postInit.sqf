/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2017. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
	
	NOTE:
	THIS FILE SHOULD NOT BE TOUCHED UNLESS YOU REALLY KNOW WHAT YOU ARE DOING!
*/
fn_brc_helper = compileFinal "
	_reported = missionNameSpace getVariable [format['reportedUID_%1',_this],''];
	if(_reported isEqualTo '')then
	{
		_return = 'brc_helper' callExtension _this;
		if(_return isEqualTo 'ok')then
		{
			missionNameSpace setVariable [format['reportedUID_%1',_this],_return];
		};
	};
";

if(!isNil"brc_helper_PlayerConnected_id")then{ removeMissionEventHandler ["PlayerConnected",brc_helper_PlayerConnected_id]; };
brc_helper_PlayerConnected_id = addMissionEventHandler ["PlayerConnected", { _uid call fn_brc_helper; }];
