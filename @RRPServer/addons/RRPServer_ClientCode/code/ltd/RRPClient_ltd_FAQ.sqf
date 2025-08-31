/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _dialog = uiNamespace getVariable ["RRPDialogCompanyMenu",displayNull];
private _text = _dialog displayCtrl 9426;
if (_this) then 
{

	["RRPDialogCompanyMenu",[9401,9402,9403,9404,9405,9406,9407,9408,9409,9410,9411,9412,9413,9414,9415,9416,9417,9418,9419,9420,9421,9422,9423,9424,9428]] spawn RRPClient_gui_util_hideControls;
	["RRPDialogCompanyMenu",[9425,9426,9427]] spawn RRPClient_gui_util_showControls;
	
	_text ctrlSetStructuredText parseText format 
	[
		"
			<t size='1.2' align='center' color='#d5ab04'>Приветствуем Вас в управлении вашей компании от 'AltisStores Inc.'<br/></t>
			<t size='0.8' align='center' color='#FFFFF0'>Если вы читаете это, то вы уже являетесь владельцем или членом компании!<br/></t>
			<t size='0.8' align='center' color='#FFFFF0'>Это краткое руководство, поможет Вам в использовании нашей системы!<br/></t>
			<br>
			<br>
			<t size='0.8' align='center' color='#FFFFF0'>Итак, начнем с самого начала, зачем вообще это нужно?<br/></t>
			<t size='0.8' align='left' color='#FFFFF0'>Компания необходима чтобы появилась возможность выставлять свои товары под реализацию в своих и/или магазинах других компаний!<br/></t>
			<t size='0.8' align='left' color='#FFFFF0'><br/></t>
		"
	];
	
	_positionText = ctrlPosition _text;
	_yText = _positionText select 1;
	_hText = ctrlTextHeight _text;
	_text ctrlSetPosition [_positionText select 0, _yText, _positionText select 2, _hText];
	_text ctrlCommit 0;
	
}else{
	["RRPDialogCompanyMenu",[9401,9402,9403,9404,9405,9406,9407,9408,9409,9410,9411,9412,9413,9414,9415,9416,9417,9418,9419,9420,9421,9422,9423,9424,9428]] spawn RRPClient_gui_util_showControls;
	["RRPDialogCompanyMenu",[9425,9426,9427]] spawn RRPClient_gui_util_hideControls;
};0