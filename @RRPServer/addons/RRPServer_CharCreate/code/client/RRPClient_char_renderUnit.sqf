disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogCharCreate",displayNull];
if (isNull _display) exitWith {};
comment "Set Unit position";
private _position = [((getPosWorld player) select 0),((getPosWorld player) select 1),((getPosWorld player) select 2) + 1000];

comment "Create Hangar";
private _hangar = "Land_GarageRow_01_small_F" createVehicleLocal [0,0,0];
_hangar setPosAtl _position;
_hangar setVectorUp [0,0,1];
_position = (_hangar modelToWorld [1.25317,-2.56958,-1.54255]);

comment "create lights";
private _light_1 = "#lightpoint" createvehiclelocal (_hangar modelToWorld [-2.2915,1.68579,1.61863]);
private _light_2 = "#lightpoint" createvehiclelocal (_hangar modelToWorld [2.16382,-5.780761,1.46427]);

_light_1 setlightbrightness 0.5;
_light_1 setlightcolor [1,1,1];
_light_1 setlightambient [1,1,1];

_light_2 setlightbrightness 0.5;
_light_2 setlightcolor [1,1,1];
_light_2 setlightambient [1,1,1];

comment "Create NPC";
private _local_npc = (typeof player) createVehicleLocal [0,0,0];
_local_npc allowDamage false;
_local_npc enablesimulation true;

removeUniform _local_npc;
removeVest _local_npc;
removeBackpack _local_npc;
removeGoggles _local_npc;
removeHeadGear _local_npc;
removeAllWeapons _local_npc;
removeAllItems _local_npc;

_local_npc forceAddUniform (uniform player);
_local_npc addBackpack (backPack player);
_local_npc addVest (vest player);
_local_npc addGoggles (goggles player);
_local_npc addHeadgear (headgear player);

_local_npc setVariable ["BIS_enableRandomization", false];
_local_npc setVariable ["BIS_fnc_animalBehaviour_disable", true];
_local_npc disableAI "ANIM";
_local_npc disableAI "MOVE";
_local_npc disableAI "FSM";
_local_npc disableAI "AUTOTARGET";
_local_npc disableAI "TARGET";
_local_npc disableAI "CHECKVISIBLE";
_local_npc removeAllEventHandlers "HandleDamage";

_local_npc setFace (face player);

comment "Add camera logic";
_attachToObject = "Logic" createVehicleLocal [0, 0, 0];
_attachToObject setPosWorld _position;
_attachToObject setDir 270;

_local_npc reveal _attachToObject;

_attachToObject disableCollisionWith _local_npc;
_local_npc disableCollisionWith _attachToObject;

_local_npc attachTo [_attachToObject, [0, 0, 0]];

_display setVariable ["npc",_local_npc];

_anims = ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"];
_local_npc switchMove (_anims select 0);
_local_npc setVariable ["Animations", _anims];

_local_npc addEventHandler	["AnimDone", {
	private["_local_npc", "_animations"];
	_local_npc = _this select 0;
	_animations = _local_npc getVariable ["Animations", []];
	_local_npc switchMove (_animations select floor(random (count _animations)));
	true
}]; 

private _cam = "camera" camCreate getPosWorld _hangar;
_cam cameraEffect ["internal","back"];
_cam camprepareFocus [-1,-1];
_cam camPrepareFOV 0.35;
_cam camcommitprepared 0;
showcinemaborder true;

_cam setPosWorld (_hangar modeltoworld [-1.3,-1.5,0]);
_cam setDir 120;

_display setVariable ["objects",[_cam,_local_npc,_hangar,_light_1,_light_2]];
