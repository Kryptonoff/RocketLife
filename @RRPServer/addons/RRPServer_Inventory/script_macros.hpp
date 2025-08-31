/* Log Stuff */
#define FILELINE format["[%1:%2] ",_fnc_scriptName,__LINE__ + 1]
#define LOG(MESSAGE) diag_log (FILELINE + MESSAGE)
#define LOG_1(MESSAGE,A) diag_log format [FILELINE + MESSAGE + "%1",format [' : A = ''%1''', A]]
#define LOG_2(MESSAGE,A,B) diag_log format [FILELINE + MESSAGE + "%1",format [' : A = ''%1'' : B = ''%2''', A,B]]
#define LOG_3(MESSAGE,A,B,C) diag_log format [FILELINE + MESSAGE + "%1",format [' : A = ''%1'' : B = ''%2'' : C = ''%3''', A,B,C]]
#define LOG_4(MESSAGE,A,B,C,D) diag_log format [FILELINE + MESSAGE + "%1",format [' : A = ''%1'' : B = ''%2'' : C = ''%3'' : D = ''%4''', A,B,C,D]]
#define LOG_5(MESSAGE,A,B,C,D,E) diag_log format [FILELINE + MESSAGE + "%1",format [' : A = ''%1'' : B = ''%2'' : C = ''%3'' : D = ''%4'' : E = ''%5''', A,B,C,D,E]]

#define HINT_1(MESSAGE,A) hint format [FILELINE + MESSAGE + "%1",format [' : A = ''%1''', A]]
#define HINT_2(MESSAGE,A,B) hint format [FILELINE + MESSAGE + "%1",format [' : A = ''%1'' : B = ''%2''', A,B]]
#define HINT_3(MESSAGE,A,B,C) hint format [FILELINE + MESSAGE + "%1",format [' : A = ''%1'' : B = ''%2'' : C = ''%3''', A,B,C]]
#define HINT_4(MESSAGE,A,B,C,D) hint format [FILELINE + MESSAGE + "%1",format [' : A = ''%1'' : B = ''%2'' : C = ''%3'' : D = ''%4''', A,B,C,D]]
#define HINT_5(MESSAGE,A,B,C,D,E) hint format [FILELINE + MESSAGE + "%1",format [' : A = ''%1'' : B = ''%2'' : C = ''%3'' : D = ''%4'' : E = ''%5''', A,B,C,D,E]]

/* System Wide Stuff */
#define SUB(var1,var2) var1 = var1 - var2
#define ADD(var1,var2) var1 = var1 + var2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define DCASH ExtremoClientCashMoneyD
#define CASH ExtremoClientCashMoney
#define BANK ExtremoClientAtmMoney
#define GANG_FUNDS grpPlayer GVAR ["gang_bank",0]
#define GANG_NAME grpPlayer GVAR ["gang_name",""]
#define VAR(NAME) ExtremoClient##NAME
#define FATFNC(MODUL,NAME) ExtremoClient##_##MODUL##_##NAME

#define SERVER_SETTINGS(TYPE,SETTING) TYPE(configFile >> "CfgServerSettings" >> SETTING)
#define EXTDB "extDB3" callExtension
//RemoteExec Macros
#define RSERV 2 //Only server
#define RCLIENT -2 //Except server
#define RANY 0 //Global

//Namespace Macros
#define SVAR_MNS missionNamespace setVariable
#define GVAR_MNS missionNamespace getVariable
#define SVAR_UINS uiNamespace setVariable
#define SVAR_PNS parsingNamespace setVariable
#define GVAR_UINS uiNamespace getVariable
#define SVAR_PRNS profileNamespace setVariable
#define GVAR_PRNS profileNamespace getVariable

//Scripting Macros
#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if(typeName var == "STRING") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)
#define PVAR_ALL(var) publicVariable var
#define PVAR_SERV(var) publicVariableServer var
#define PVAR_ID(var,id) id publicVariableClient var
#define GVAR getVariable
#define SVAR setVariable
#define RIFLE primaryWeapon player
#define RIFLE_ITEMS primaryWeaponItems player
#define PISTOL handgunWeapon player
#define PISTOL_ITEMS handgunItems player
#define LAUNCHER secondaryWeapon player
#define LAUNCHER_ITEMS secondaryWeaponItems player
#define PHEADGEAR headGear player
#define PBINOCULAR binocular player
#define PUNIFORM uniform player
#define PUNIFORM_ITEMS uniformItems player
#define PVEST vest player
#define PVEST_ITEMS vestItems player
#define PBACKPACK backpack player
#define PBACKPACK_ITEMS backpackItems player
#define PGOOGLES goggles player
#define P_ASSIGNED assignedItems player
#define CURWEAPON currentWeapon player
#define ANIMSTATE animationState player
#define GVAR_RNAME(unit1) unit1 GVAR ["realname",""]
#define GVAR_RTITLE(unit1) unit1 GVAR ["realtitle",""]
#define GVAR_RESTRAINED(unit1) unit1 GVAR ["restrained",false]
#define NOTATTACHED(unit1) (isNull attachedTo unit1)
#define NOTSKIPE_ANIM(unit1,anime) (animationState unit1 isEqualTo anime)

//Display Macros
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)

#define CONTROL_DATA(ctrl) (lbData[ctrl,lbCurSel ctrl])
#define CONTROL_VALUE(ctrl) (lbValue[ctrl,lbCurSel ctrl])
#define CONTROL_TEXT(ctrl) (lbText[ctrl,lbCurSel ctrl])

#define CONTROL_DATAI(ctrl,index) ctrl lbData index
#define CONTROL_TEXTI(ctrl,index) ctrl lbText index
#define CONTROL_VALUEI(ctrl,index) ctrl lbValue index

#define SETFADE(ctrl,var,commit) \
ctrl ctrlSetFade var; \
ctrl ctrlCommit commit;

#define FADEANIM(ctrl,commit) \
ctrl ctrlSetFade 1; \
ctrl ctrlCommit 0; \
ctrl ctrlSetFade 0; \
ctrl ctrlCommit commit;

//System Macros
#define grpPlayer group player
#define steamid getPlayerUID player

//Condition Macros
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define ISANIMSTATE(condition1) (animationState player) isEqualTo condition1
#define ISPSIDE(condition1) playerSide isEqualTo condition1
#define NOTINVEH(condition1) isNull objectParent condition1
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}

#define LSALIVE(unit1) unit1 GVAR ["lifeState",""] isEqualTo "HEALTHY"
#define LSNOTALIVE(unit1) unit1 GVAR ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]

#define LSINCAP(unit1) unit1 GVAR ["lifeState",""] isEqualTo "INCAPACITATED"
#define LSDEAD(unit1) unit1 GVAR ["lifeState",""] isEqualTo "DEAD"
#define LSRESP(unit1) unit1 GVAR ["lifeState",""] isEqualTo "RESPAWN"



//new for config system
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define M_CONFIG2(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define BASE_CONFIG(CFG,CLASS) inheritsFrom(configFile >> CFG >> CLASS)
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)

#define ITEM_VARNAME(varName) format ["life_inv_%1",M_CONFIG(getText,"VirtualItems",varName,"variable")]
#define ITEM_VALUE(varName) GVAR_MNS [ITEM_VARNAME(varName),0]
#define ITEM_NAME(varName) M_CONFIG(getText,"VirtualItems",varName,"displayName")
#define ITEM_ICON(varName) M_CONFIG(getText,"VirtualItems",varName,"icon")
#define ITEM_WEIGHT(varName) M_CONFIG(getNumber,"VirtualItems",varName,"weight")

#define LICENSE_VARNAME(varName,flag) format ["license_%1_%2",flag,M_CONFIG(getText,"LifeCfgLicenses",varName,"variable")]
#define LICENSE_VALUE(varName,flag) GVAR_MNS [LICENSE_VARNAME(varName,flag),false]

#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "LifeCfgSettings" >> SETTING)
#define LIFE_SETTINGSWORLD(TYPE,WRD,SETTING) TYPE(missionConfigFile >> "LifeCfgSettings" >> WRD >> SETTING)
#define LIFE_GTITLE(WRD,TTL) getText(missionConfigFile >> "LifeCfgGarages" >> WRD >> TTL >> "displayName")

#define RECIPE_VARNAME(varName) format["recipe_%1",M_CONFIG(getText,"LifeCfgRecipes",varName,"variable")]
#define RECIPE_VALUE(varName) GVAR_MNS [RECIPE_VARNAME(varName),false]

#define LIFE_MARKERWORLD(TYPE,WRD,SETTING) TYPE(missionConfigFile >> "LifeCfgMapMarkers" >> WRD >> SETTING)

#define ARC_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "LifeCfgArcheology" >> SETTING)
#define WZ_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "LifeCfgWarZones" >> SETTING)

//SpyGlass Macros
#define SPYGLASS_END \
    vehicle player setVelocity[1e10,1e14,1e18]; \
    uiSleep 3; \
    preProcessFile "SpyGlass\endoftheline.sqf"; \
    uiSleep 2.5; \
    failMission "SpyGlass";