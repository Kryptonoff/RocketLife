/*
Author:	Arrra

http://steamcommunity.com/id/sdfsfsdgdfgdgdfg/

My VK:https://vk.com/id478482025
*/
try{
	private _brevno = _this select 0;
	private _uid = getPlayerUID player;                                                                      
	private _totalLogs = life_job_car getVariable ["totallogs", 0];

		if (!life_job_active) throw "Вы не находитесь на службе или работе. По поводу трудоустройства нужно обратится соответствующую структуру ";
		if (isNull life_job_car) throw "Машина не определена";
		if(_totalLogs >= 23) throw "Кузов забит под завязку!";
		_totalLogs = _totalLogs + 1;
		life_job_car setVariable ["totallogs",_totalLogs,true];
		
	Switch (_totalLogs) do {
		case 1: {_brevno attachTo [life_job_car, [-1, -3.5, 1.3] ]; _brevno setdir 90;};
		case 2: {_brevno attachTo [life_job_car, [-0.5, -3.5, 1.3] ]; _brevno setdir 90;};
		case 3: {_brevno attachTo [life_job_car, [0, -3.5, 1.3] ]; _brevno setdir 90;};
		case 4: {_brevno attachTo [life_job_car, [0.5, -3.5, 1.3] ]; _brevno setdir 90;};
		case 5: {_brevno attachTo [life_job_car, [1, -3.5, 1.3] ]; _brevno setdir 90;};
		case 6: {_brevno attachTo [life_job_car, [-0.8, -3.5, 1.6] ]; _brevno setdir 90;};
		case 7: {_brevno attachTo [life_job_car, [-0.3, -3.5, 1.6] ]; _brevno setdir 90;};
		case 8: {_brevno attachTo [life_job_car, [0.3, -3.5, 1.6] ]; _brevno setdir 90;};
		case 9: {_brevno attachTo [life_job_car, [0.8, -3.5, 1.6] ]; _brevno setdir 90;};
		case 10: {_brevno attachTo [life_job_car, [-1, -3.5, 1.9] ]; _brevno setdir 90;};
		case 11: {_brevno attachTo [life_job_car, [-0.5, -3.5, 1.9] ]; _brevno setdir 90;};
		case 12: {_brevno attachTo [life_job_car, [0, -3.5, 1.9] ]; _brevno setdir 90;};
		case 13: {_brevno attachTo [life_job_car, [0.5, -3.5, 1.9] ]; _brevno setdir 90;};
		case 14: {_brevno attachTo [life_job_car, [1, -3.5, 1.9] ]; _brevno setdir 90;};
		case 15: {_brevno attachTo [life_job_car, [-0.8, -3.5, 2.2] ]; _brevno setdir 90;};
		case 16: {_brevno attachTo [life_job_car, [-0.3, -3.5, 2.2] ]; _brevno setdir 90;};
		case 17: {_brevno attachTo [life_job_car, [0.3, -3.5, 2.2] ]; _brevno setdir 90;};
		case 18: {_brevno attachTo [life_job_car, [0.8, -3.5, 2.2] ]; _brevno setdir 90;};
		case 19: {_brevno attachTo [life_job_car, [-1, -3.5, 2.5] ]; _brevno setdir 90;};
		case 20: {_brevno attachTo [life_job_car, [-0.5, -3.5, 2.5] ]; _brevno setdir 90;};
		case 21: {_brevno attachTo [life_job_car, [0, -3.5, 2.5] ]; _brevno setdir 90;};
		case 22: {_brevno attachTo [life_job_car, [0.5, -3.5, 2.5] ];_brevno setdir 90;};
		case 23: {_brevno attachTo [life_job_car, [1, -3.5, 2.5] ]; _brevno setdir 90;};
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};