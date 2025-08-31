[] spawn {
	disableSerialization;
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;
	private _slide = _mainGroup controlsGroupCtrl 21000;
	private _map = _slide controlsGroupCtrl 21006;
	waitUntil {ctrlCommitted _slide};
	_map ctrlMapSetPosition [0.6 * safezoneW,0.03 * safezoneH,0.211394 * safezoneW,0.3652 * safezoneH]; 

	for '_i' from 0 to 9 do {
		deleteMarkerLocal format['%1_cs',_i]
	};
	deleteMarkerLocal format['%1_marker',player]; 
	if !(getMarkerSize 'loc_1' isEqualTo [0,0]) then 
	{
		{
			deleteMarkerLocal format['loc_%1',_forEachIndex]
		} forEach life_cs_locsCache;
	};
};