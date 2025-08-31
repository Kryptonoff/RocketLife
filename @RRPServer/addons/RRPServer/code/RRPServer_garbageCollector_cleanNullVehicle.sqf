/*
	Project: Aurora Role Play 
	Author: FairyTale#5571
	License:: CC BY-ND 

	Usage: Вызывать только вручную, при закрытом сервере или обосреться по полной
*/

private _fnc = {
	private ["_vehicleData","_config","_price","_find"];
	_vehicleData = format ["loadBasePriceVi:%1",_this] call RRPServer_DB_selectSingle;
	_vehicleData params ["_id","_classname","_pid","_baseprice"];

	if !(isClass (configFile >> "CfgVehicles" >> _classname)) then
	{
		_price = _baseprice;
		_coefs = [
			["Mrshounka_subaru08_Rework_noir_f",2000000],
			["MrShounka_Peugeot508_Rework_noir_f",2000000],
			["Mrshounka_c63_2015_Rework_noir_f",2000000],
			["Mrshounka_rs4_Rework_noir_f",2000000],
			["Mrshounka_a3_dodge15_Rework_noir_f",3000000],
			["Mrshounka_rs6_avant_Rework_noir_f",4000000],
			["MrShounka_audi_RS5_Rework_p_noir_f",4000000],
			["Mrshounka_bmwm6_Rework_noir_f",4000000],
			["Mrshounka_mercedes_clk_Rework_noir_f",4000000],
			["Mrshounka_mustang_Rework_noir_f",4000000],
			["Mrshounka_mercedes_190_Rework_noir_f",5000000],
			["Mrshounka_bmw_1series_Rework_noir_f",5000000],
			["Mrshounka_transam_Rework_noir_f",5000000],
			["Mrshounka_lincoln_Rework_noir_f",5000000],
			["Mrshounka_Volkswagen_Touareg_Rework_noir_f",5000000],
			["Mrshounka_cayenne_Rework_noir_f",6000000],
			["Mrshounka_jeep_blinde_Rework_noir_f",5000000],
			["MrShounka_audiq7_Rework_noir_f",5000000],
			["Mrshounka_chevrolet_avalanche_noir_f",5000000],
			["Mrshounka_hummer_Rework_noir_f",10000000],
			["Mrshounka_Bowler_Rework_noir_f",5000000],
			["Quiet_c65amg_noir_f",5000000],
			["MrShounka_Huracan_Rework_p_noir_f",10000000],
			["Mrshounka_veveno_Rework_p_noir_f",25000000],
			["Mrshounka_lykan_Rework_p_noir_f",25000000],
			["Mrshounka_agera_Rework_p_noir_f",25000000],
			["Mrshounka_a3_gtr_Rework_noir_f",25000000],
			["Mrshounka_pagani_Rework_p_noir_f",25000000],
			["MrShounka_porsche911_92_Rework_noir_f",25000000],
			["Mrshouka_fordgt_Rework_noir_f",25000000],
			["Mrshounka_mp4_Rework_p_noir_f",25000000],
			["Mrshounka_ferrari_f430_scuderia_Rework_noir_f",25000000],
			["Mrshounka_monster_Rework_noir_f",25000000],
			["Mrshounka_citroen_nemo_Rework_blanche_f",1000000],
			["AlessioStingrayG",25000000],
			["AlessioGTB_Gold",25000000],
			["AlessioSuperfastG",40000000],
			["AlessioMustangGold",25000000],
			["AlessioAgeraG",40000000],
			["AlessioAventadorG",40000000],
			["AlessioC63NG",25000000],
			["AlessioC63G",25000000],
			["AlessioMGAG",25000000],
			["AlessioIXMRG",25000000],
			["AlessioGTRG",35000000],
			["Alessio918G",35000000],
			["AlessioBMG",25000000],
			["AlessioR8_Gold",40000000],
			["AlessioBM4M",25000000],
			["smart_ivory_190e",5000000],
			["smart_ivory_evox",5000000],
			["smart_ivory_r34",7000000],
			["smart_ivory_e36",7000000],
			["smart_ivory_supra",7000000],
			["smart_ivory_rs4",6000000],
			["smart_ivory_isf",6000000],
			["smart_ivory_wrx",6000000],
			["smart_ivory_m3",7000000],
			["smart_ivory_elise",8000000],
			["smart_ivory_c",7000000],
			["smart_ivory_gt500",9000000],
			["smart_ivory_mp4",10000000],
			["smart_ivory_lfa",20000000],
			["smart_ivory_veyron",30000000],
			["RDS_Lada_Civ_01",1000000],
			["RDS_Lada_Civ_02",1000000],
			["RDS_Lada_Civ_03",1000000],
			["RDS_Lada_Civ_04",1000000],
			["RDS_Lada_Civ_05",1000000],
			["RDS_Lada_Civ_06",1000000],
			["RDS_Lada_Civ_07",1000000],
			["RDS_Gaz24_Civ_01",1000000],
			["RDS_Gaz24_Civ_02",1000000],
			["RDS_Gaz24_Civ_03",1000000],
			["RDS_Golf4_Civ_01",1000000],
			["RDS_Golf4_Civ_02",1000000],
			["RDS_Golf4_Civ_03",1000000],
			["RDS_Golf4_Civ_04",1000000],
			["RDS_Golf4_Civ_05",1000000],
			["RDS_Golf4_Civ_06",1000000],
			["RDS_S1203_Civ_01",1000000],
			["RDS_S1203_Civ_02",1000000],
			["RDS_S1203_Civ_03",1000000],
			["RDS_S1203_Civ_04",1000000],
			["RDS_S1203_Civ_05",1000000],
			["RDS_S1203_Civ_06",1000000],
			["RDS_S1203_Civ_07",1000000],
			["RDS_S1203_Civ_08",1000000],
			
			["GeK_UAZ_3303",1000000],
			["GeK_Zil_bleu",1000000],
			["ivory_wrx_mar",8000000],
			["Subaru_RAF",8000000],
			["ivory_m3",8000000]
		];
		_find = [_coefs,_classname] call RRPClient_util_find; 
		if !(_find isEqualTo -1) then 
		{
			_price = (_coefs select _find) select 1; 
		};
		format ["addToBankPlayer:%1:%2",_price,_pid] call RRPServer_DB_fireAndForget;
		format ["deleteVehicle:%1",_id] call RRPServer_DB_fireAndForget;
		format ["Vehicle %1 deleted, compensation %2 to %3 ID: %4 #1001",_classname,_price,_pid,_id] call RRPServer_util_debugConsole;
	};
	true
};

private["_continueLoading", "_page", "_pageSize", "_IDs", "_number", "_i"];
"Loading vehicles from database..." call RRPServer_util_debugConsole;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do 
{
	_IDs = format ["loadingIdPageVehicles:%1:%2", _page * _pageSize, _pageSize] call RRPServer_DB_selectFull;
	_number = count _IDs;
	if (_number > 0) then 
	{
		for "_i" from 0 to _number - 1 do 
		{
			((_IDs select _i)select 0) call _fnc;
		};
	};
	_page = _page + 1;
	if (_number < 100) then
	{
		_continueLoading = false;
	};
};
"Done cleaning vehicle!" call RRPServer_util_debugConsole;
true
