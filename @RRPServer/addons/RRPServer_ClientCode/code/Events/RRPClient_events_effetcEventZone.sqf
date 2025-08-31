/*
	Author:	Arrra
	SteamID: 76561198090549826
	Discord: merkava#9745
	My VK:https://vk.com/id478482025
*/

#include "..\..\script_macros.hpp"
uiSleep 1;
if (isNil "ClientEventInfo") exitWith {};

private _Radmarker = (ClientEventInfo # 0);
private _Radius = (ClientEventInfo # 2);
private _RadiusDividedTwo = round(_Radius / 2);
private _RadiusDividedFour = round(_RadiusDividedTwo / 2);
private _RadiusDividedEight = round(_RadiusDividedFour / 2);
private _DamageCoef = 0.07;

while {!(isNil "ClientEventInfo")} do 
{

	if (player distance (getMarkerPos _Radmarker) < _Radius) then
	{ 
		_DamageCoef =  switch (true) do 
		{
			case (player distance (getMarkerPos _Radmarker) < _Radius) : {_DamageCoef}; //x1
			case (player distance (getMarkerPos _Radmarker) < _RadiusDividedTwo) : {_DamageCoef * 2}; //x2
			case (player distance (getMarkerPos _Radmarker) < _RadiusDividedFour) : {_DamageCoef * 4}; //x4
			case (player distance (getMarkerPos _Radmarker) < _RadiusDividedEight) : {_DamageCoef * 8}; //x8
			default {0};
		};
		
		_DamageCoef = if (life_radx_used) then {round(_DamageCoef / 2.5)} else {_DamageCoef};
		["InfoTitleAndText",["<t font='PuristaMedium'>Event</t>","<t><img image='\smart_icons_pack\paa\massage_dlya_hintov\Radioactive.paa' size='200'/></t><t color='#FFFFFF' font='PuristaMedium'>Вы зашли радиактивную зону, здесь очень сильные радиационные поля, чем ближе к центру, тем фон больше. Покиньте немедено эту зону!!!</t>"]] call SmartClient_gui_toaster_addTemplateToast;
		"Вы зашли в радиоктивную зону, здесь очень сильные поля, чем ближе к центру, тем фон больше. Покиньте немедено эту зону!!!" call chat;
		
		if ((damage player) < 0.89) then {player setDamage ((damage player) + _DamageCoef)} else {[player,player] call RRPClient_dmg_Agony;};
		
		"radialBlur" ppEffectEnable true;
		"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
		"radialBlur" ppEffectCommit 3;
		"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.74, -0.12, 0.76],[0.2, 0.77, 0.17, 0.06]];
		"colorCorrections" ppEffectCommit 3;
		"colorCorrections" ppEffectEnable true;
		"filmGrain" ppEffectEnable true;
		"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
		"filmGrain" ppEffectCommit 5;
		player say3d "radiation1";
	} 
	else
	{
		"ColorCorrections" ppEffectCommit 10;
		"ColorCorrections" ppEffectEnable false;
		"radialBlur" ppEffectCommit 10;
		"radialBlur" ppEffectEnable false;
	};	
	uiSleep 10;
	if (isNil "ClientEventInfo") exitWith {};
};