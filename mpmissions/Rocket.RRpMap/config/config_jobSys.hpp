/*
	class cuttree //название работы которое приходит с нпс, должно быть таким же как и вызове с нпс!
	{
	unifrom = ""; //форма которая должна быть надета для старта работы
	backpack = ""; //сумка которая должна быть надета для старта работы
	headgear = ""; //говоной убор который должнен быть надет для старта работы
	Work_car = ""; //класс нейм машины,который спавнится для определенной работы
	spawn_car = ""; //название маркера, куда спавнится машина
	};
*/


class SmartJobs
{
    class allcars 
	{
    AllJobCar[] = {"Jonzie_Log_Truck"}; //КРОМЕ delivery сюда обязательно вписывать все машины которые выдаются при работе, потому-то после перезахода не будет ключей от машины!!!!
	};
	
	
	class cuttree
	{
	unifrom = "";
	backpack = "";
	headgear = "";
	Work_car = "Jonzie_Log_Truck";
	spawn_car = "tree_cut_spawncar"; 
	price = 2000;
	};
	
	class dhl
	{
	unifrom = "";
	backpack = "";
	headgear = "";
	Work_car = "C_Van_01_box_F_EXT_DHL";
	spawn_car = "life_dhl_car"; 
	dhl_box = "plp_cts_CanisterWhite";
	dhl_price = 1; //цена за 1метр
	life_dp_points[] = {"dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"};
	};
	
	class delivery
	{
	unifrom = "";
	backpack = "";
	headgear = "";
	Work_car = "";
	spawn_car = ""; 
	needcar[] = {"B_Truck_01_mover_F","C_Offroad_01_F","C_Van_01_transport_F"}; //сюда вписывать все машины на которых можно работать дальнобойщиком
	};
	
	class portwork
	{
	unifrom = "";
	backpack = "";
	headgear = "";
	Work_car = "";
	spawn_car = ""; 
	boxSmall = "PaperWorkBox";
	boxBig = "C_IDAP_CargoNet_01_supplies_F";
	price = 25;
	};

};