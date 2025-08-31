class CfgHints
{
	font = "RobotoCondensedLight";
	textSize = 1;
	class show
	{
		text = "<t valign='top' size='1.5'><img image='\rimas_agent\assets\keys\icons8-right-curly-parentheses--key-64.paa'/></t> Cкрыть подсказку";
		condition = "true";
	};
	class tutorial
	{
		text = "<t valign='top' size='1.5'><img image='\rimas_agent\assets\keys\icons8-insert-key-64.paa'/></t> Инструкции";
		condition = "true";
	};
	class tablet
	{
		text = "<t valign='top' size='1.5'><img image='\rimas_agent\assets\keys\icons8-y-key-64.paa'/></t> Планшет";
		condition = "!dialog";
	};
	class animations
	{
		text = "<t valign='top' size='1.5'><img image='\rimas_agent\assets\keys\icons8-key1-64.paa'/>-<img image='\rimas_agent\assets\keys\icons8-key9-64.paa'/></t> Жесты";
		condition = "isNull objectParent player or {!dialog}";
	};
	class closeVeh
	{
		text = "<t valign='top' size='1.5'><img image='\rimas_agent\assets\keys\icons8-u-key-64.paa'/></t> Открыть/Закрыть";
		condition = "true";
	};
	class map
	{
		text = "<t valign='top' size='1.5'><img image='\rimas_agent\assets\keys\icons8-m-key-64.paa'/></t> Карта";
		condition = "true";
	};
	class weaponHide
	{
		text = "<t valign='top' size='1.5'><img image='\rimas_agent\assets\keys\icons8-shift-64-2.paa'/>+<img image='\rimas_agent\assets\keys\icons8-h-key-64.paa'/></t> Оружие за спину";
		condition = "currentWeapon player isNotEqualTo '' ";
	};
	class handsdown
	{
		text = "<t valign='top' size='1.5'><img image='\rimas_agent\assets\keys\icons8-shift-64-2.paa'/>+<img image='\rimas_agent\assets\keys\icons8-v-key-64.paa'/></t> Опустить руки";
		condition = "player getVariable ['surrender',false]";
	};
	class handsup
	{
		text = "<t valign='top' size='1.5'><img image='\rimas_agent\assets\keys\icons8-shift-64-2.paa'/>+<img image='\rimas_agent\assets\keys\icons8-v-key-64.paa'/></t> Поднять руки";
		condition = "!(player getVariable ['surrender',false])";
	};
};