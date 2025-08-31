disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _skillSlide = _mainGroup controlsGroupCtrl 29000;

private _configPath = missionConfigFile >> "CfgSkills";
private _gradient = "\A3\ui_f\data\igui\rscingameui\rscunitinfo\gradient_ca.paa";
private _startTextY = 0.010996;
private _startBtnBuyY = 0.0659786;
private _listGroup = _skillSlide controlsGroupCtrl 29001;
{ctrlDelete _x}forEach (allControls _listGroup);

_sort = {
  _namespaces = [];
  {
    _configName = configName _x;
    _exp = (missionNamespace getVariable [_configName,[0,0]]) select 1;
    _namespaces pushBack [_exp,_configName];
  }forEach ("true" configClasses (missionConfigFile >> "CfgSkills"));
  _namespaces sort false;
  _namespaces
};

{
    _configName = _x select 1;
    _toNext = _configName call RRPClient_skills_util_toNextLvl;
    _progress = _display ctrlCreate ["AppRscStructuredText",-1,_listGroup];
    _progress ctrlSetPosition [0.00309113 * safezoneW,_startTextY * safezoneH,0,0.051 * safezoneH];
    _nzxt = if (_toNext isEqualType "") then {0.247519 * safezoneW}else
    {
      ((_toNext select 0) / (_toNext select 1)) * (0.247519 * safezoneW)
    };
    _progress ctrlSetBackgroundColor [0, 0.78, 0.89, 1];
    _progressMax = _nzxt;
    _progress ctrlCommit 0;
    _progress ctrlSetPositionW _progressMax;
    _progress ctrlCommit 0.8;
    _progress ctrlEnable false;

    _name = parseText format["<t shadow='2' font='SFCompactText'>%1</t>",getText(_configPath >> _configName >> "displayName")];
    _nzxt = if (_toNext isEqualType "") then {_toNext}else{
      (format ["<t font='SFCompactText' shadow='2'>Уровень: %3<br/>XP: %1/%2</t>",
      [_toNext select 0] call RRPClient_util_numberText,
      [_toNext select 1] call RRPClient_util_numberText,
      (_toNext select 2)])};
    [_listGroup,-1,[0.00309113 * safezoneW,_startTextY * safezoneH,0.247519 * safezoneW,0.051 * safezoneH],_nzxt,"PuristaLight",1,'right',"#ffffff",'2',[0.1,0.1,0.1,0]] call RRPClient_gui_util_makeStructuredText;
    [_listGroup,-1,[0.00309113 * safezoneW,_startTextY * safezoneH,0.247519 * safezoneW,0.051 * safezoneH],_name,"RobotoRegular",1.4,'left',"#ffffff",'2',[0.1,0.1,0.1,0]] call RRPClient_gui_util_makeStructuredText;

    if (getNumber(_configPath >> _configName >> "xpPerRc") != 0) then
    {
      _ctrlButton = _display ctrlCreate ["TabletButton",-1,_listGroup];
      _ctrlButton ctrlSetPosition [0.1735 * safezoneW,_startBtnBuyY * safezoneH,0.0773373 * safezoneW,0.0219929 * safezoneH];
      _ctrlButton ctrlSetStructuredText parseText "<t size='.9'>SaveTime</t>";
      _ctrlButton ctrlEnable true;
      _ctrlButton ctrlSetEventHandler ["ButtonClick",format["[%1] call RRPClient_skills_saveTimeAsk",str(_configName)]];
      _ctrlButton ctrlCommit 0;
    };
    _startBtnBuyY = _startBtnBuyY + 0.087971;

    _grad = [_listGroup,-1,[0.00309113 * safezoneW,_startTextY * safezoneH,0.247519 * safezoneW,0.051 * safezoneH],_gradient,false,false,[0.1,0.1,0.1,0.45]] call RRPClient_gui_util_makeStaticPicture;
    _grad ctrlSetAngle [180,0.5,0.5,true];
    _text = if (_toNext isEqualType "") then {_toNext}else{format ["Уровень %1 из %2, %3 XP необходимо до следующего уровня",(_toNext select 2),getNumber(_configPath >> _configName >> "maxLevel"),[(((_toNext select 1) - (_toNext select 0)) + 1)] call RRPClient_util_numberText]};
    _grad ctrlSetTooltip _text;
    _grad ctrlEnable true;
    _grad setVariable ["prof",_configName];
    _grad ctrlAddEventHandler ["MouseEnter","_this call RRPClient_skills_onMouseEnter"];
    _startTextY = _startTextY + 0.0879714;
} forEach (call _sort);
