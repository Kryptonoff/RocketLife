/*
  Project: Aurora Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

params ["_caller","_key","_shift","_ctrl","_alt"];
private _stopPropagation = false;
switch (_key) do
{
	case 0x52, case 0x0B: { 0 call RRPClient_keyPad_addDigit; _stopPropagation = true; };
	case 0x4F, case 0x02: { 1 call RRPClient_keyPad_addDigit; _stopPropagation = true; };
	case 0x50, case 0x03: { 2 call RRPClient_keyPad_addDigit; _stopPropagation = true; };
	case 0x51, case 0x04: { 3 call RRPClient_keyPad_addDigit; _stopPropagation = true; };
	case 0x4B, case 0x05: { 4 call RRPClient_keyPad_addDigit; _stopPropagation = true; };
	case 0x4C, case 0x06: { 5 call RRPClient_keyPad_addDigit; _stopPropagation = true; };
	case 0x4D, case 0x07: { 6 call RRPClient_keyPad_addDigit; _stopPropagation = true; };
	case 0x47, case 0x08: { 7 call RRPClient_keyPad_addDigit; _stopPropagation = true; };
	case 0x48, case 0x09: { 8 call RRPClient_keyPad_addDigit; _stopPropagation = true; };
	case 0x49, case 0x0A: { 9 call RRPClient_keyPad_addDigit; _stopPropagation = true; };
	case 0x0E:
	{
		PinCode = PinCode select [0,(count PinCode) -1];
		playSound "pressButtonKeyPad";
		call RRPClient_keyPad_updateControls;
		_stopPropagation = true;
	};
	case 0x1C:
	{
		closeDialog 0;
		_stopPropagation = true;
	};
	case 0x9C:
	{
		closeDialog 0;
		_stopPropagation = true;
	};
	case 0x01:
	{
		PinCode = "";
		closeDialog 0;
		_stopPropagation = true;
	};
	default {};
};
_stopPropagation
