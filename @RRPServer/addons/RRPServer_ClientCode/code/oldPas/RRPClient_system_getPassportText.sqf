/*

	Filename: 	RRPClient_system_getPassportText.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

call RRPClient_system_passportConfig;

private _img = format ["<img size='10' color='#FFFFFF' image='%1'/>",getText(missionConfigFile >> "LifeCfgPassports" >> life_myPassportID >> "image")];
if (player getVariable ["realtitle",""] == "") then {
format["%1<br/><br/>
	<t size='1.2'>%4</t><br/><br/>
	<t color='#e8c302' size='0.85'>Имя</t><br/>
	<t size='1.5'>%2</t><br/><br/>
	<t color='#e8c302' size='0.85'>ID: </t><br/>
	<t size='1.2'>%3</t>",_img,player getVariable ["realname",""],(call RRPClientPlayerID),player getVariable ["realtag",""]];
} else {
format["%1<br/><br/>
<t color='#e8c302' size='0.85'>Имя</t><br/>
<t size='1.2'>%5</t><br/>
<t size='1.2' color ='#00fffc'>%2</t><br/>
<t size='1.5'>%3</t><br/>
<t color='#e8c302' size='0.85'>ID: </t><br/>
<t size='1.2'>%4</t>",_img,player getVariable ["realtitle",""],player getVariable ["realname",""],(call RRPClientPlayerID),player getVariable ["realtag",""]];
};
