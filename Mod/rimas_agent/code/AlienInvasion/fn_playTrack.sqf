#include "common_defines.inc"
disableSerialization; 

if (SIMGetVal(SIMRunning)) then 
{
	0 fadeMusic 0.1;
	playMusic [selectRandom ["BackgroundTrack03_F"], -0.8];
};