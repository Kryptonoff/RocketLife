waitUntil {!isNull (findDisplay 8)};
ctrlActivate ((findDisplay 8) displayCtrl 2);


_displayMulti = uiNamespace getVariable 'RscDisplayMultiplayer';
ctrlDelete (_displayMulti displayCtrl 111902);
ctrlDelete (_displayMulti displayCtrl 111903);
{ _x ctrlShow true; } forEach allControls _displayMulti;