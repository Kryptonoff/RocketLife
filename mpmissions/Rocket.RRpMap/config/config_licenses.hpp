class LifeCfgLicenses
{
	/*
		Если состоит из одного слова, пиши variable целиком, а если с двух, делай аббревиатуру!
		Пример: Cigane => cigane и Black snow => bs
	*/
	
	
	//spawn licenses
	class AtiraSpawn
	{
		variable="AtiraSpawn";
		displayName="Прописка Атира";
		price=25000;
		conditionsExtradition="false";
		conditionsConfiscation="false";
		buyable=1;
		gang=0;
	};
	class SofiaSpawn: AtiraSpawn
	{
		variable="SofiaSpawn";
		displayName="Прописка София";

	};
	class DP11Spawn: AtiraSpawn
	{
		variable="DP11Spawn";
		displayName="Прописка Айос-Дионис";
	};
	class judge
	{
		variable="judge";
		displayName="Министерство Юстиции";
		price=0;
		conditionsExtradition="false";
		conditionsConfiscation="false";
		buyable=0;
		gang=1;
	};
	
	

	//driver licenses
	class boat
	{
		variable="boat";
		displayName="Лицензия моряка";
		price=1000;
		conditionsExtradition="false";
		conditionsConfiscation="false";
		buyable=1;
		gang=0;
	};
	class driver: boat
	{
		variable="driver";
		displayName="Лицензия водителя";
		price=2000;
	};
	class truck: boat
	{
		variable="truck";
		displayName="Лицензия дальнобойщика";
		price=5000;
	};
	class air: boat
	{
		variable="air";
		displayName="Лицензия пилота";
		price=50000;
	};
	
	class gun
	{
		variable="gun";
		displayName="Лицензия на оружие";
		price=20000;
		conditionsExtradition="true";
		conditionsConfiscation="true";
		buyable=1;
		gang=0;
	};
	class home
	{
		variable="home";
		displayName="Лицензия домовладельца";
		price=25000;
		conditionsExtradition="false";
		conditionsConfiscation="false";
		buyable=1;
		gang=0;
	};
	class diver
	{
		variable="dive";
		displayName="Лицензия дайвера";
		price=5000;
		conditionsExtradition="false";
		conditionsConfiscation="false";
		buyable=1;
		gang=0;
	};
	class dive: diver {};
	

	class slavery
	{
		variable="slavery";
		displayName="Работорговец";
		price=100000;
		conditionsExtradition="false";
		conditionsConfiscation="false";
		buyable=1;
		gang=0;
	};
	class marijuana: slavery
	{
		variable="marijuana";
		displayName="Мед. марихуанна";
		price=10000;
	};
};