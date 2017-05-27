class shop_dialog{
	idd=-1;
	movingenable=false;
			class controls{
	////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by BeerRush, v1.063, #Cosaly)
////////////////////////////////////////////////////////

class shop_frame: RscFrame
{
	idc = 1800;
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.360937 * safezoneW;
	h = 0.462 * safezoneH;
};
class shop_label1: RscText
{
	idc = 1000;
	text = "Vehicles"; //--- ToDo: Localize;
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.340312 * safezoneW;
	h = 0.033 * safezoneH;
};
class shop_listbox1: RscListbox
{
	idc = 1500;
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.309375 * safezoneW;
	h = 0.165 * safezoneH;
};
class shop_label2: RscText
{
	idc = 1001;
	text = "Weapon Packs"; //--- ToDo: Localize;
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.345469 * safezoneW;
	h = 0.033 * safezoneH;
};
class shop_listbox2: RscListbox
{
	idc = 1501;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.304219 * safezoneW;
	h = 0.154 * safezoneH;
};
class shop_button1: RscButton
{
	soundClick[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundClick", 0.07, 1};
	idc = 1600;
	text = "BUY"; //--- ToDo: Localize;
	x = 0.62375 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.0825 * safezoneH;
	onButtonClick = "_this spawn smm_shop_on_vehicle;false";
};
class shop_button2: RscButton
{	
	soundClick[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundClick", 0.07, 1};
	idc = 1601;
	text = "BUY"; //--- ToDo: Localize;
	x = 0.62375 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.154 * safezoneH;
	onButtonClick = "_this spawn smm_shop_on_pack;false";
};
class shop_button3: RscButton
{
	soundClick[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundClick", 0.07, 1};
	idc = 1602;
	style = 18;
	text = "Place"; //--- ToDo: Localize;	
	x = 0.62375 * safezoneW + safezoneX;
	y = 0.390 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.0825 * safezoneH;
	lineSpacing = 1;
	onButtonClick = "_this spawn smm_shop_on_vehicle_pos;false";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


	};
};

class RscTitles
{
	class HeadupMoney
	{    
		idd = -1;
		duration = 1;
		class controls
		{
			class TextControl
			{    
				idc = 1337;
				type = 0;
				style = 0;
				x = 0; 
				y = 0;
				w = 1;
				h = 1;
				font = "EtelkaNarrowMediumPro";
				sizeEx = 0.1;
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				text = "Example Text";
			};  
		};	
	};
};