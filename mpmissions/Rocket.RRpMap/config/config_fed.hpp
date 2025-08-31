class CfgFed {
	class unlockDomeSettings {//хранилища
		plantBombTime = 60; //время на закладку бомбы
		waitBombTime = 30; //время до взрыва бомбы

		setupDrillTime = 60; //время на установку дрели
		waitDrillTime = 120; //время до окончания работы дрели
	};

	class unlockOfficeSettings {//офисы
		setupDrillTime = 60; //время на установку дрели
		waitDrillTime = 120; //время до окончания работы дрели
	};

	awardPercentFromGovBank = 0.01; //процент от казны, который используется при расчете награды
	returnComission = 0.5; //процент, который получают при возврате золота
	maxAward = 5000000; //максимальная награда
	timeToClose = 60*60*2; //время до закрытия ворот

	awardItem = "RRP_Gold"; //айтем, который появляется в хранилищах

	armoredVehicleClass = "B_G_Offroad_01_armed_F"; //вооруженная техника, класснейм
	cargoVehicleClass = "RRPVehicle_knur_lk"; //грузовая техника, класснейм
};
