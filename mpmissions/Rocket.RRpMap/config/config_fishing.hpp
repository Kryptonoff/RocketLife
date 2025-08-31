#define true 1
#define false 0

class LifeCfgFishing {
	gethooked = 50;//вероятность поймать рыбу когда она клюнула
	prof = "Fishing_Prof"; //скилл для учета
	xpAmount = 50; //сколько экспы за пойманную рыбу

	//вероятности должны быть в порядке от меньшего к большему,
	//{{массив с айтемами}, шанс выпадения, необходимый уровень}
	fish[] = {
		{{"RRPItem_Mackrel_F"},75,0},
		{{"RRPItem_Ornate_F"},65,2},
		{{"RRPItem_Mullet_F"},55,5},
		{{"RRPItem_Salema_F"},45,10},
		{{"RRPItem_CatShark_F"},35,20},
		{{"RRPItem_Tuna_F"},25,25}
	};
};