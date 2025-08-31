/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	license: CC BY-ND
	Usage: "STRING" call RRPClient_util_copyToClipboard
*/

private "_string";
_string = _this;
_string = _string + " ";
"ace_clipboard" callExtension _string;
"ace_clipboard" callExtension "--COMPLETE--";