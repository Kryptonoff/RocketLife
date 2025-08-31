class fishing_config {

    version = 4; // 4.0 - 4.3 -> 4 | version 4.4+ -> 5

	vitemsclassname = "VirtualItems";  	 //Classname for you VirtualItems In the Vtiemsconfg or masterconfig


	pickupitem = "You Unhook A ";//This is before the item name
	pickupitem2 = ".";	//this is after the item name

	//Text When you reel in with something on the line
	reelin = "The Line Feels heavy when you reel it in";

	//Text When you reel in without somthing on the line
	reelinfail = "The Line Feels very light when you reel it in";

	gethooked = 50;

	//Text when your fishing line breaks
	brokenline = "The Line Broke recast";

	You_cannot_fish_here = "Its not possible to fish here!";

	//Add the virtual items you wish to be able to catch. It will select a random item for the array so you can add as many items as you want
	//50%
	Fishing_common[] = {
		 "salema_raw"
		,"mackerel_raw"
	};
	//35%
	Fishing_uncommon[] = {
		 "ornate_raw"
	};
	//10%
	Fishing_rare[] = {
		 "cocaine_unprocessed"
	};
	//5%
	Fishing_veryrare[] = {
		 "goldbar"
	};

};
