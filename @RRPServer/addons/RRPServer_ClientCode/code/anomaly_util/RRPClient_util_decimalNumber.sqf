/*
	Author: Aloe <itfruit@mail.ru>

	Description:  Форматирование числа
	
	Parameter(s):
		_num 		(Number) - число
		_n 			(Number) - порядок 
	
	Return: (Number)
*/
	
params ["_num", "_n"];	
_num =+ round (_num * (10 ^ _n)) / (10 ^ _n);	
_num;