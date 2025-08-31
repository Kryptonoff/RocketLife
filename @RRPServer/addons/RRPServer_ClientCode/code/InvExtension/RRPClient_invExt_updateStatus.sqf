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
private ["_strShowMoney","_lbShowLicense","_display"];
_display = findDisplay 602;
_strShowMoney = _display displayCtrl 3002;
_lbShowLicense = _display displayCtrl 3007;

_strShowMoney ctrlSetStructuredText parseText format["<t size = '0.8'><img image='\rimas_pad\icons\icon-money-cash.paa'/> <t>$%2</t><br/><img image='\rimas_pad\icons\icon-money-bank.paa'/> <t>$%3</t><br/><img image='\rimas_pad\icons\icon-money-dcash.paa'/> <t>$%1</t></t>",[RRPClientCashMoneyD] call RRPClient_util_numberText, [RRPClientCashMoney] call RRPClient_util_numberText, [RRPClientAtmMoney] call RRPClient_util_numberText];
{
  if (missionNamespace getVariable [format ["license_%1",getText(_x >> "variable")],false]) then {
    _lbShowLicense lbAdd format["%1",(getText(_x >> "displayName"))];
  };
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgLicenses"));
