/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [['_title', 'ERROR: No Title'], ['_rewardCode', {}],['_var','WHAT? WHAT?']];
if (!canSuspend) exitWith {_this spawn RRPClient_ach_complete};
private _previousGroup = uiNamespace getVariable['achievementsPopupGroup', controlNull];
if (!isNull _previousGroup) then {
	ctrlDelete _previousGroup
};
RRPClientCompleteAch pushBackUnique _var;
[[RRPClientCompleteAch,getPlayerUID player],"ach_save"] call RRPClient_system_hcExec;
0 spawn _rewardCode;
playSound "Topic_Selection";
playSound "ZoomIn";
private _pW = parseNumber(((pixelW * 5) * 1) toFixed 3);
private _pH = parseNumber(((pixelH * 5) * 1) toFixed 3);
private _display = findDisplay 46;
private _hlGradientTexture = "\A3\ui_f\data\gui\rsccommon\rscbackgroundgui\gradient_left_gs.paa";
private _hrGradientTexture = "\A3\ui_f\data\gui\rsccommon\rscbackgroundgui\gradient_right_gs.paa";
private _group = _display ctrlCreate ['RscControlsGroupNoScrollbars', -1];
private _text = format["<t align ='center'><t color ='#FFD700'size ='%2'>ПОЛУЧЕНО ДОСТИЖЕНИЕ</t><br/><t size ='%3'>%1</t><br/></t>",_title,200*_pH,140*_pH];
_group ctrlSetPosition [0.20 * safezoneW + safezoneX,0.03 * safezoneH + safezoneY,0.6 * safezoneW,0.09 * safezoneH];
_group ctrlEnable true;
_group ctrlSetFade 1;
_group ctrlCommit 0;
(ctrlPosition _group) params['_gX','_gY','_gW','_gH'];
_group ctrlSetPosition[0.20 * safezoneW + safezoneX,0 * safezoneH + safezoneY,0.6 * safezoneW,0.001 * safezoneH];
_group ctrlCommit 0;uiNamespace setVariable['achievementsPopupGroup',_group];
[_group,-1,[0,0,_gW/2,_gH],_hrGradientTexture,false,false,[0.1,0.1,0.1,0.75]]call RRPClient_gui_util_makeStaticPicture;
[_group,-1,[_gW/2,0,_gW/2,_gH],_hlGradientTexture,false,false,[0.1,0.1,0.1,0.75]]call RRPClient_gui_util_makeStaticPicture;
[_group,-1,[0,0,_gW,_gH],"\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa",false,false,[1,1,1,0.5]]call RRPClient_gui_util_makeStaticPicture;
[_group,-1,[0,0*_pH,_gW,_gH],_text,'PuristaMedium',220*_pH,"left","#FFFFFF","0 ",[0,0,0,0]]call RRPClient_gui_util_makeStructuredText;
_group ctrlSetFade 0;
_group ctrlSetPosition[ 0.20 * safezoneW + safezoneX, 0.03 * safezoneH + safezoneY, 0.6 * safezoneW, 0.09 * safezoneH ];
_group ctrlCommit 0.5;
waitUntil{ctrlCommitted _group};
if(isNull _group) exitWith{};
uiSleep 5;
_group ctrlSetPosition[0.20 * safezoneW + safezoneX,0.03 * safezoneH + safezoneY,0.001 * safezoneW,0.09 * safezoneH];
_group ctrlCommit 0.5;
playSound"ZoomOut";
waitUntil{ctrlCommitted _group};
ctrlDelete _group;