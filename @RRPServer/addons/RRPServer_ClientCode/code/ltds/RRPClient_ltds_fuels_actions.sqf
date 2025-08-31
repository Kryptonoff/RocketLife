private _mode = param [0,"",[""]];

try
{
	switch _mode do
	{
		case "setZakup": {};
		case "setSell": {};
		case "pay": {};
		case "upgrade": {};
		case "withdraw": {};
		case "deposit": {};
		case "removeFuel": {};
		default {};
	};
}catch{
	["ErrorTitleAndText",["Управление бизнесом",_exception]] call SmartClient_gui_toaster_addTemplateToast;	
};
true