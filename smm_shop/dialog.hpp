
class RscDisplayAmmobox {
	idd = -1;
	enableSimulation = 1;
	onLoad = "_this call smm_fnc_onLoadVehicleAmmobox";
	onUnload = "";
	class ControlsBackground {
		class BackgroundTitle: IGUIBack
		{
			idc = 2201;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class BackgroundMain: IGUIBack
		{
			idc = 2200;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.396 * safezoneH;
		};
	}
	class Controls {
		class RemoveMagButton: RscButton 
		{
			idc = 1602;
			text = "-";
			borderSize = 0;
			colorShadow[] = {0,0,0,0};
		}
		class AddMagButton: RemoveMagButton
		{
			idc = 1603;
			text = "+";
		}
		class ContentsListNBox: RscListNBox
		{
			idc = 1500;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.286 * safezoneH;
			drawSideArrows = 1;
			idcLeft = 1602;
			idcRight = 1603;
			columns[] = {0.05, 0.2, 0.55, 0.75};
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
		};
		class CostText: RscText
		{
			idc = 1000;
			text = "Total Cost:  0 $";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VehicleDropdown: RscCombo
		{
			idc = 2100;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonOk: RscButton
		{
			idc = 1600;
			text = "Buy";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class ContentsText: RscText
		{
			idc = 1001;
			text = "Contents:";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class TitleText: RscText
		{
			idc = 1002;
			text = "Vehicle Ammobox";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ButtonCancel: RscButton
		{
			idc = 1601;
			text = "X";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
