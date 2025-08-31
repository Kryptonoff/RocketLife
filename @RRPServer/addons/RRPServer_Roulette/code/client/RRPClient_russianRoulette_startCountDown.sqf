
private["_endTime"];
_endTime = _this; 
call RRPClient_russianRoulette_stopCountDown;
RRPClientRussianRouletteCountDownThread = _endTime spawn RRPClient_russianRoulette_countDownThread;