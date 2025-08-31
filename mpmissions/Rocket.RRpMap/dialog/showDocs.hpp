class showLicense {
	idd = 2500;
	name= "RRPshowLicense";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad="true call RRPClient_gui_util_blur; uiNamespace setVariable ['RRPshowLicense',_this select 0];";
	onUnload = "false call RRPClient_gui_util_blur; ctrlTreeDocSelected = nil; uiNamespace setVariable ['RRPshowLicense',displayNull]; curDocID = nil"; 

	class Controls {
		class bg: RRP_background_fade
	    {
	        idc = 1200;
	        text = "";
	        x = 0;
	        y = 0.04;
	        w = 1;
	        h = 0.96;
	    };
	    class title: RRP_title
	    {
	        idc = 1201;
	        text = "";
	        x = 0;
	        y = 0;
	        w = 0.9625;
	        h = 0.04;
	    };
	    class exit: RRP_btn_exit_text
	    {
	        idc = 1202;
	        x = 0.9625;
	        y = 0;
	        w = 0.0375;
	        h = 0.04;
	    };
	    class license_tree: RscTree
	    {
	        idc = 1203;
	        text = "";
			colorBackground[] = {0,0,0,0};
			onTreeSelChanged = "[_this] call Client_documents_viewSelect";
	        x = 0.025;
	        y = 0.06;
	        w = 0.4625;
	        h = 0.9;
	    };
	    class license_descr: RRP_RscStructuredText
	    {
	        idc = 1204;
	        text = "";
	        x = 0.5;
	        y = 0.06;
	        w = 0.475;
	        h = 0.8;
	    };
	    class delete_license: RRP_btn_yellow
	    {
	        idc = 1205;
	        text = "Удалить документ";
	        x = 0.5;
	        y = 0.88;
	        w = 0.475;
	        h = 0.08;
	    };
	};
};
