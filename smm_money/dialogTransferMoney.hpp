class RscTransferMoney {
	idd = 45600;
	enableSimulation = 1;
	onLoad = "";
	onUnload = "";
	class ControlsBackground {
		class Background: IGUIBack
		{
			idc = 2200;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.165 * safezoneH;
			colorbackground[] = 
			{
				"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
				"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
				"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
				"0.8"
			};
		};
	};
	class Controls {
		class LabelTopic: RscText
		{
			idc = 1000;
			text = "Transfer Money to %1";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class TextfieldAmount: RscEdit
		{
			idc = 1400;
			text = "0";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class LabelBalance: RscText
		{
			idc = 1001;
			text = "/ error";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Slider: RscSlider
		{
			idc = 1900;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ButtonOk: RscButton
		{
			idc = 1600;
			text = "Transfer";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			action = "[ctrlText 1400] call smm_fnc_transferMoney";
		};
		class ButtonClose: RscButton
		{
			idc = 1601;
			text = "Cancel";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
	};
};