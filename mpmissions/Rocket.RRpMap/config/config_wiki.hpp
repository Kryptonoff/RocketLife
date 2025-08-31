/*
	Структура элемента:
	1: Иконка
	2: Заголовок
	3: Текст

	В тексте используется StructuredText https://community.bistudio.com/wiki/Structured_Text
*/

class CfgWiki
{
	class GeneralWiki
	{
		displayName = "Общая информация";
		class Farming
		{
			displayName = "Фарминг";
			pages[] = {
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
			};
		};
	};
	class CiviliansWiki
	{
		displayName = "Гражданские";
		class rules
		{
			displayName = "Правила";
			pages[] = {
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
			};
		};
		class rules2
		{
			displayName = "Правила";
			pages[] = {
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
				{	
					"icons\ico_apple.paa",
					"Apples Field",
					"Apples Field Apples Field<br/>Apples Field Apples Field"
				},
			};
		};
	};
	class CopWiki: CiviliansWiki
	{
		displayName = "Полицейские";
	};
	class BanditWiki: CiviliansWiki
	{
		displayName = "Бандитизм";
	};
};

