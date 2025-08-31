/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _plate = "";
private _alphabet = ["A","B","C","E","H","I","K","M","O","P","T","X","Y"];
private _number = ["0","1","2","3","4","5","6","7","8","9"];
private _name1 = selectRandom _alphabet;
private _name2 = selectRandom _alphabet;
private _number1 = selectRandom _number;
private _number2 = selectRandom _number;
private _number3 = selectRandom _number;
private _number4 = selectRandom _number;
private _name3 = selectRandom _alphabet;
private _name4 = selectRandom _alphabet;
format ["%1%2 %3%4%5%6 %7%8",_name1,_name2,_number1,_number2,_number3,_number4,_name3,_name4]
