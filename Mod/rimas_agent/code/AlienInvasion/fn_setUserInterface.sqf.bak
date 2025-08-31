#include "common_defines.inc"
disableSerialization;

#define OFFSET(VAL) (VAL*_size)

params ["_disp", "_ctrlGrp"];

private _size = UIGetVal(UIInterfaceSize);

//private _disp = findDisplay 46 createDisplay "RscDisplayEmpty";
UISetVal(UIGameDisplay, _disp);

//private _ctrlGrp = _disp ctrlCreate ["RscControlsGroupNoScrollbars", -1];
//_ctrlGrp ctrlEnable false;
//_ctrlGrp ctrlSetPosition [0-(_size-1)/2, 0-(_size-1)/2, _size,_size];
//_ctrlGrp ctrlCommit 0;

UISetVal(UIGontrolsGroup, _ctrlGrp);

_bgPos = [0,0,_size,_size*4/3];
_ctrlBG = _disp ctrlCreate ["RscPicture", -1, _ctrlGrp];
_ctrlBG ctrlShow false;
_ctrlBG ctrlSetText "Sprites\bg_ca.paa";
_ctrlBG ctrlSetPosition _bgPos;
_ctrlBG ctrlCommit 0;
_ctrlBG ctrlShow true;
_ctrlBG setVariable ["Position", _bgPos];
UISetVal(UIBGCtrl, _ctrlBG);

_ctrlUFORamp = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlUFORamp ctrlShow false;
_ctrlUFORamp ctrlSetText "Sprites\UFO\ramp_ca.paa";
_ctrlUFORamp setVariable ["CommitStarted", false];
UISetVal(UIUFORampCtrl, _ctrlUFORamp);

_ctrlUFO = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlUFO ctrlShow false;
_ctrlUFO ctrlSetText "Sprites\UFO\ufo_ca.paa";
_ctrlUFO ctrlSetPosition [_size / 2 - OFFSET(0.395), OFFSET(-0.3), OFFSET(0.8), OFFSET(0.4)];
_ctrlUFO ctrlCommit 0;
_ctrlUFO ctrlSetPosition [_size / 2 - OFFSET(0.395), OFFSET(0.17), OFFSET(0.8), OFFSET(0.4)];
_ctrlUFO setVariable ["CommitStarted", false];
UISetVal(UIUFOCtrl, _ctrlUFO);

_disp setVariable ["AlienSpriteInfo", []];
private _allSprites = _disp getVariable "AlienSpriteInfo";

{	
	switch (_forEachIndex) do
	{
		case 0:
		{
			private _w = _size / 19;
			_y = OFFSET(0.5);
			_pos = 7 * _w;
			{
				_alienCtrl = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
				_alienCtrl ctrlShow false;
				switch (_forEachIndex) do
				{
					case 0: { _alienCtrl ctrlSetText "Sprites\Alien\alien_left_ca.paa" };
					case 1: { _alienCtrl ctrlSetText "Sprites\Alien\alien_straight_ca.paa" };
					case 2: { _alienCtrl ctrlSetText "Sprites\Alien\alien_right_ca.paa" };
				};
				_alienCtrl ctrlSetPosition [_pos + OFFSET(0.004), _y, _w - OFFSET(0.008), _w - OFFSET(0.008)];
				_alienCtrl ctrlCommit 0;
				_pos = _pos + _w * 2;
				_disp setVariable [_x, _alienCtrl];             
				_allSprites pushBack _alienCtrl;
			}
			forEach _x;
		};
		case 1:
		{
			private _w = _size / 18;
			_y = OFFSET(0.56);
			_pos = 6 * _w;
			{
				_alienCtrl = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
				_alienCtrl ctrlShow false;
				_alienCtrl ctrlSetText (["Sprites\Alien\alien_right_ca.paa", "Sprites\Alien\alien_left_ca.paa"] select (_forEachIndex %2 == 0));
				_alienCtrl ctrlSetPosition [_pos + OFFSET(0.003), _y, _w - OFFSET(0.006), _w - OFFSET(0.006)];
				_alienCtrl ctrlCommit 0;
				_pos = _pos + _w;
				_disp setVariable [_x, _alienCtrl];
				_allSprites pushBack _alienCtrl;
			}
			forEach _x;
		};
		case 2:
		{
			private _w = _size / 17;
			_y = OFFSET(0.63);
			_pos = 5 * _w;
			{
				_alienCtrl = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
				_alienCtrl ctrlShow false;
				switch (_forEachIndex) do
				{
					case 0: { _alienCtrl ctrlSetText "Sprites\Alien\alien_left_ca.paa" };
					case 1: { _alienCtrl ctrlSetText "Sprites\Alien\alien_straight_left_ca.paa" };
					case 2: { _alienCtrl ctrlSetText "Sprites\Alien\alien_straight_right_ca.paa" };
					case 3: { _alienCtrl ctrlSetText "Sprites\Alien\alien_right_ca.paa" };
				};
				_alienCtrl ctrlSetPosition [_pos + OFFSET(0.002), _y, _w - OFFSET(0.004), _w - OFFSET(0.004)];
				_alienCtrl ctrlCommit 0;
				_pos = _pos + 2 * _w;
				_disp setVariable [_x, _alienCtrl];
				_allSprites pushBack _alienCtrl;
			}
			forEach _x;
		};
		case 3:
		{
			private _w = _size / 16;
			_y = OFFSET(0.71);
			_pos = 4 * _w;
			{
				_alienCtrl = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
				_alienCtrl ctrlShow false;
				_alienCtrl ctrlSetText (["Sprites\Alien\alien_right_ca.paa", "Sprites\Alien\alien_left_ca.paa"] select (_forEachIndex %2 == 0));
				_alienCtrl ctrlSetPosition [_pos + OFFSET(0.001), _y, _w - OFFSET(0.002), _w - OFFSET(0.002)];
				_alienCtrl ctrlCommit 0;
				_pos = _pos + _w;
				_disp setVariable [_x, _alienCtrl];
				_allSprites pushBack _alienCtrl;
			}
			forEach _x;
		};
		case 4:
		{
			private _w = _size / 15;
			_y = + OFFSET(0.8);
			_pos = 3 * _w;
			{
				_alienCtrl = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
				_alienCtrl ctrlShow false;
				switch (_forEachIndex) do
				{
					case 0: { _alienCtrl ctrlSetText "Sprites\Alien\alien_left_ca.paa" };
					case 1: { _alienCtrl ctrlSetText "Sprites\Alien\alien_straight_left_ca.paa" };
					case 2: { _alienCtrl ctrlSetText "Sprites\Alien\alien_straight_straight_ca.paa" };
					case 3: { _alienCtrl ctrlSetText "Sprites\Alien\alien_straight_right_ca.paa" };
					case 4: { _alienCtrl ctrlSetText "Sprites\Alien\alien_right_ca.paa" };
				};
				_alienCtrl ctrlSetPosition [_pos, _y, _w, _w];
				_alienCtrl ctrlCommit 0;
				_pos = _pos + 2 * _w;
				_disp setVariable [_x, _alienCtrl];
				_allSprites pushBack _alienCtrl;
			}
			forEach _x;
		};
	};
}
forEach 
[
	["00","01","02"],
	["10","11","12","13","14","15"],
    ["20","21","22","23"],
	["30","31","32","33","34","35","36","37"],
	["40","41","42","43","44"]
];

private _catcherCtrls = [];
_catcherW = _size / 15;
_offset = OFFSET(0.35);
_pos = _catcherW * 2;

_startSpriteIndex = 5;

{
	_catcherCtrl = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
	_catcherCtrl ctrlShow false;
	_catcherCtrl ctrlSetText (if (_x == "-") then { "Sprites\Catcher\walk_ca.paa" } else { "Sprites\Catcher\catch_ca.paa" });	
	_catcherCtrl ctrlSetPosition [_pos - _offset, _size - _offset, _catcherW + 2 * _offset, _offset];
	_catcherCtrl ctrlCommit 0;
	_pos = _pos + _catcherW;
	_catcherCtrls pushBack _catcherCtrl;
	if (_forEachIndex == _startSpriteIndex) then { UISetVal(UICatcherCtrl, _catcherCtrl) };
	_catcherCtrl setVariable ["Position", _x];
}
forEach ["-", "40", "-", "41", "-", "42", "-", "43", "-", "44", "-"];

_disp setVariable ["CatcherSpriteInfo", [_startSpriteIndex, 1, 9, _catcherCtrls]];
AlienInvasion getVariable "Catcher" set [2, _catcherCtrls select _startSpriteIndex getVariable "Position"]; 

_ctrlScore = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlScore ctrlEnable false;
_ctrlScore ctrlShow false;
_ctrlScore ctrlSetText "Sprites\score_ca.paa";
_ctrlScore ctrlSetPosition [OFFSET(0.01), OFFSET(0.02), OFFSET(0.13), OFFSET(0.13)];
_ctrlScore ctrlCommit 0;
UISetVal(UICatcherScoreCtrl, _ctrlScore);

_ctrlScoreNumber1 = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlScoreNumber1 ctrlEnable false;
_ctrlScoreNumber1 ctrlSetText "";
_ctrlScoreNumber1 ctrlSetPosition [OFFSET(0.13), OFFSET(0.05), OFFSET(0.08), OFFSET(0.08)];
_ctrlScoreNumber1 ctrlCommit 0;
UISetVal(UICatcherScoreNumber1Ctrl, _ctrlScoreNumber1);

_ctrlScoreNumber2 = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlScoreNumber2 ctrlEnable false;
_ctrlScoreNumber2 ctrlSetText "";
_ctrlScoreNumber2 ctrlSetPosition [OFFSET(0.19), OFFSET(0.05), OFFSET(0.08), OFFSET(0.08)];
_ctrlScoreNumber2 ctrlCommit 0;
UISetVal(UICatcherScoreNumber2Ctrl, _ctrlScoreNumber2);

_ctrlScoreNumber3 = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlScoreNumber3 ctrlEnable false;
_ctrlScoreNumber3 ctrlSetText "";
_ctrlScoreNumber3 ctrlSetPosition [OFFSET(0.25), OFFSET(0.05), OFFSET(0.08), OFFSET(0.08)];
_ctrlScoreNumber3 ctrlCommit 0;
UISetVal(UICatcherScoreNumber3Ctrl, _ctrlScoreNumber3);

_ctrlLivesNumber1 = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlLivesNumber1 ctrlEnable false;
_ctrlLivesNumber1 ctrlSetText "";
_ctrlLivesNumber1 ctrlSetPosition [_size - OFFSET(0.26), OFFSET(0.05), OFFSET(0.08), OFFSET(0.08)];
_ctrlLivesNumber1 ctrlCommit 0;
UISetVal(UICatcherLivesNumber1Ctrl, _ctrlLivesNumber1);

_ctrlLivesNumber2 = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlLivesNumber2 ctrlEnable false;
_ctrlLivesNumber2 ctrlSetText "";
_ctrlLivesNumber2 ctrlSetPosition [_size - OFFSET(0.20), OFFSET(0.05), OFFSET(0.08), OFFSET(0.08)];
_ctrlLivesNumber2 ctrlCommit 0;
UISetVal(UICatcherLivesNumber2Ctrl, _ctrlLivesNumber2);


_ctrlLives = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlLives ctrlEnable false;
_ctrlLives ctrlShow false;
_ctrlLives ctrlSetText "Sprites\lives_ca.paa";
_ctrlLives ctrlSetPosition [_size - OFFSET(0.14), OFFSET(0.02), OFFSET(0.13), OFFSET(0.13)];
_ctrlLives ctrlCommit 0;
UISetVal(UICatcherLivesCtrl, _ctrlLives);

_ctrlZap = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlZap ctrlShow false;
_ctrlZap ctrlSetText "Sprites\Catcher\zap_ca.paa";
_ctrlZap ctrlSetPosition [0, 0, 0, 0];
_ctrlZap ctrlsetFade 1;
_ctrlZap ctrlCommit 0;
_ctrlZap ctrlShow true;
UISetVal(UIZapEffectCtrl, _ctrlZap);

_ctrlFail = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlFail ctrlShow false;
_ctrlFail ctrlSetText "Sprites\Alien\catchfail_ca.paa";
_ctrlFail setVariable ["HoldControl", false];
UISetVal(UIFailEffectCtrl, _ctrlFail);

_endPos = [0,0-OFFSET(0.1),_size,_size*4/3];
_ctrlEnd = _disp ctrlCreate ["RscPictureKeepAspect", -1, _ctrlGrp];
_ctrlEnd ctrlShow false;
_ctrlEnd ctrlSetText "Sprites\gameover_ca.paa";
_ctrlEnd ctrlSetPosition [0, 0-OFFSET(0.1) - OFFSET(0.01),_size,_size*4/3];
_ctrlEnd ctrlCommit 0;
_ctrlEnd setVariable ["Position", _endPos];
UISetVal(UIGameOverCtrl, _ctrlEnd);

_disp displayAddEventHandler ["KeyDown", { call KK_fnc_onKeyDown }];
_disp displayAddEventHandler ["Unload", { call KK_fnc_exitGameCleanup }];

_player = AlienInvasion getVariable "GAME" select 0;
_player switchCamera "EXTERNAL";
_player hideObject true;
_player enableSimulation false;
showHud false;