[
	"RRPClient_tablet_app_trx_faq_onopen",
	"RRPClient_tablet_app_trx_onOpen",
	"RRPClient_trx_buyRequest",
	"RRPClient_trx_buyResponse"
]apply
{
	missionNamespace setVariable[_x, compile preprocessFileLineNumbers format["\RRPServer_TRX\client\%1.sqf",_x],true];
};

[
	"RRPServer_trx_buyRequest"
]apply
{
	missionNamespace setVariable[_x, compile preprocessFileLineNumbers format["\RRPServer_TRX\server\%1.sqf",_x]];
};
