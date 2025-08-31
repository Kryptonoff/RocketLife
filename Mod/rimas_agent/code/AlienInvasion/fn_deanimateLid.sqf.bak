disableSerialization;

params ["_display"];

uiSleep 0.1;
terminate (_display getVariable ["openlidscript", scriptNull]);

private _screen = uiNamespace getVariable ["AlienInvasionCtrlGroup", controlNull];
_screen ctrlShow false;
private _laptop = _display displayCtrl 100;

private _phase = _laptop ctrlAnimationPhaseModel "Lid"; 
while { _phase > 0 } do 
{
	_laptop ctrlAnimateModel ["Lid", _phase]; 
	_phase = _phase - 0.01; 
	uiSleep 0.01;
};

uiNamespace setVariable ["AlienInvasionDispRef", nil];
uiNamespace setVariable ["AlienInvasionCtrlGroup", nil];
closeDialog 2;