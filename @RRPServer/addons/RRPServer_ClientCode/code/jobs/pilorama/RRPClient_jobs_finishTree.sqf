/*

Author:	Arrra

http://steamcommunity.com/id/sdfsfsdgdfgdgdfg/

My VK:https://vk.com/id478482025

	
["cuttree"] call SmartClient_jobs_startjobs; //пример в нпс
*/
#include "..\..\..\script_macros.hpp"
try{
	private _jobName = _this select 0;
	private _price = getNumber(missionConfigFile >> "SmartJobs" >> _jobName >> "price");
	private _totalLogs = life_job_car getVariable ["totallogs",0];

	if (_totalLogs isEqualto 0) throw "Автомобиль пустой!";

	if(_price isEqualto -1) throw "Не определена цена";
	if(life_job_car distance player > 15) throw "Автомобиль должен быть рядом с пунктом переработки дерева!"; 

	{
		detach _x;
		deletevehicle _x; 
	} forEach attachedObjects life_job_car;

	_donat = switch (FETCH_CONST(life_donator)) do {
		case 1: {round(_price * 0.20)};
		case 2: {round(_price * 0.30)};
		case 3: {round(_price * 0.40)};
		case 4: {round(_price * 0.60)};
		default {0};
	};
	_prise = _price + _donat;
	_totalprice = _totalLogs * _prise;
	[player,"cash","add",STR(_totalprice)] remoteExecCall ["RRPServer_system_moneyChange",2];
	["SuccessTitleAndText", ["Успех!", format["Вы Сдали на пилораму %1 ствола(ов) древесины, ваша зарплата %2 Алтисйских долларов!",_totalLogs,_totalprice]]] call SmartClient_gui_toaster_addTemplateToast;

	life_job_car setVariable ["totallogs",0,true];
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};
