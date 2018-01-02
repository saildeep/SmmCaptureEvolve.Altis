allItems append[
	["CfgWeapons","tf_microdagr","BASE",5,true] call PurchasableItem_create
]

if(playerside == west)then {
rand_backpacks append 	[
						"tf_rt1523g",
						"tf_rt1523g_bwmod",
						"tf_rt1523g_rhs",
						"tf_rt1523g_big",
						"tf_rt1523g_big_bwmod",
						"tf_rt1523g_big_bwmod_tropen",
						"tf_rt1523g_big_rhs",
						"tf_rt1523g_sage",
						"tf_rt1523g_green",
						"tf_rt1523g_fabric",
						"tf_rt1523g_black",
						"tf_anarc210"
						];

};
if(playerside == east)then {
rand_backpacks append 	[
						"tf_mr3000",
						"tf_mr3000_multicam",
						"tf_mr3000_bwmod",
						"tf_mr3000_bwmod_tropen",
						"tf_mr3000_rhs",
						"tf_mr6000l",
						"tf_bussole"
						];
};
if(playerside == independent)then {
rand_backpacks append 	[
						"tf_anprc155",
						"tf_anprc155_coyote",
						"tf_anarc164"
						];
};