params ["_target"];

_res = "";
try {
	if (isNull _target) throw "Цель не найдена";
	if !(isPlayer _target) throw "Это не игрок";
	if !(isNull (objectParent _target)) throw "Вы в технике";
	if !(isNull (objectParent player))  throw "Цель в технике";
	if ((player distance _target) > 3) throw "Вы слишком далеко";
	if (_target getVariable ["lifeState",""] isEqualTo 'INCAPACITATED') throw "Он пока что не в состоянии";
	if (_target getVariable ["knoked",false]) throw "Он пока что не в состоянии";
	if (_target getVariable ["tazed",false])  throw "Он пока что не в состоянии";
	if (_target getVariable ["surrender", false]) throw "Он должен опустить руки";
	if (life_action_inUse) throw "Вы уже заняты";
	if (call RRPClient_system_isInterrupted) throw "Вы прервали!";
}catch{
	_res = _exception;
};
_res
